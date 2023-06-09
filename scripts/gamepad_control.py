import rospy
from std_msgs.msg import Float64MultiArray
from sensor_msgs.msg import JointState
from ur_ikfast import ur_kinematics
from scipy.spatial.transform import Rotation as R
import tkinter as tk
import numpy as np
import time
from gamepad import Gamepad
from robotiq_3f_srvs.srv import Move
import sys

rospy.init_node('gui', anonymous=True)
pub = rospy.Publisher('radian', Float64MultiArray, queue_size=10)

joint_order = [2, 1, 0, 3, 4, 5]
ur10_arm = ur_kinematics.URKinematics('ur10')

tool_length = 0.2 #distance from ur10 end and tool center

TASKSPACE_LIMITS = {'x':[-1.29, -0.62],'y':[-0.35, 0.6],'z':[0.20, 0.7]} # very very safe ;)
MAX_LIN_SPEED_TOOL = 0.05 # m/s
ROS_INTERFACE_RATE = 10 # Hz

dt = 1/ROS_INTERFACE_RATE
rate = rospy.Rate(ROS_INTERFACE_RATE) # 10hz   

def get_current_state(return_pose=True):
    current_state = rospy.wait_for_message("/joint_states", JointState)
    current_state_lst = [current_state.position[i] for i in joint_order]
    pose_matrix=None
    if return_pose:
        pose_matrix= ur10_arm.forward(current_state_lst, 'matrix')
    return current_state_lst, pose_matrix

def MoveArm(target_pose, current_pose=None, current_state=None, dx=0.01, time_from_start=10):
    # theta target is ['x','y','Z'] first two are extrinsic euler angles, last one is intrinsic
    # target_pose and current_pose are 3x4 matrices !!!
    dtheta=(1/2*np.pi)/time_from_start

    if current_pose is None or current_state is None:
        current_state, current_pose = get_current_state(return_pose=True)

    p_initial = current_pose[:3,-1]
    p_target = target_pose[:3,-1]
    target_distance = np.linalg.norm(p_target-p_initial)
    target_speed = target_distance/time_from_start  
    
    # safety check - if speed demand is within limits
    if target_speed>MAX_LIN_SPEED_TOOL:
        return
    
    n_steps=max(2, int(abs(target_distance)/dx)+1)

    # dont allow to go beyond task space limits!
    for idx, axis in enumerate(['x','y','z']):
        p_target[idx] = np.clip(p_target[idx], TASKSPACE_LIMITS[axis][0], TASKSPACE_LIMITS[axis][1])

    p_vals = np.linspace(p_initial, p_target, n_steps)[1:]

    # get euler angles from pose matrix
    current_euler = R.from_matrix(current_pose[:3,:3]).as_euler('xyz', degrees=False)
    target_euler = R.from_matrix(target_pose[:3,:3]).as_euler('xyz', degrees=False)
    idx_max_angle_change = np.argmax(np.abs(target_euler-current_euler))
    n_steps2 = max(2, int(abs(target_euler[idx_max_angle_change]-current_euler[idx_max_angle_change])/dtheta)+1)
    n_steps = max(n_steps, n_steps2)
    
    int_eulers = np.linspace(current_euler, target_euler, n_steps)[1:] # intermediate euler angles
    p_vals = np.linspace(p_initial, p_target, n_steps)[1:]

    # rospy.loginfo("intermediate_p_vals:"+np.array2string(p_vals))
    data_to_send = Float64MultiArray()

    new_pose = current_pose
    for p_target_i, euler_i in zip(p_vals, int_eulers):
        new_pose[:3,-1] = p_target_i
        new_pose[:3,:3] = R.from_euler('xyz', euler_i, degrees=False).as_matrix()
        new_joint_pos = ur10_arm.inverse(new_pose, False, q_guess=current_state)
        if new_joint_pos is not None:
            # rospy.loginfo("going to "+np.array2string(new_pose))
            data_to_send.data = [new_joint_pos[i] for i in joint_order]+[time_from_start/n_steps]
            pub.publish(data_to_send)
        else:
            rospy.loginfo("cant find solution for the orientation:"+np.array2string(euler_i))

# todo: guarantee that speed is not higher when going in diagonal direction!
def compute_target_pose(current_pose, v, w_x, w_y, w_Z, dt):
    # compute the target position
    p_initial = current_pose[:3,-1]
    target_speed = (np.linalg.norm(v)/np.sqrt(3.0))*MAX_LIN_SPEED_TOOL
    target_distance = target_speed*dt
    p_target = p_initial + target_distance*(v/(np.linalg.norm(v)+1e-5))
    # compute the target orientation
    R_initial = current_pose[:3,:3]
    R_target = R_initial
    R_target = np.dot(R_target, R.from_euler('x', w_x*dt, degrees=True).as_matrix())
    R_target = np.dot(R_target, R.from_euler('y', w_y*dt, degrees=True).as_matrix())
    R_target = np.dot(R.from_euler('Z', w_Z*dt, degrees=True).as_matrix(), R_target)
    target_pose = np.zeros((3,4), dtype=np.float32)
    target_pose[:3,:3] = R_target
    target_pose[:,-1] = p_target
    return target_pose


if __name__=="__main__":
    output_file = sys.argv[1]
    gamepadType = Gamepad.LogitechRumblePad2
    if not Gamepad.available():
        print('Please connect your gamepad...')
        while not Gamepad.available():
            time.sleep(1.0)
    gamepad = gamepadType()
    gamepad.startBackgroundUpdates()

    # gripper control thread
    open_hand_call = rospy.ServiceProxy('/robotiq_3f_gripper/open_hand', Move)
    close_hand_call = rospy.ServiceProxy('/robotiq_3f_gripper/close_hand', Move)

    v = np.array([0.0, 0.0, 0.0], dtype=np.float32)

    w_Z = 0.0
    w_x = 0.0
    w_y = 0.0
    dT  = 10.0
    # open the file
    output_file_handler = open(output_file, 'w')
    while (not rospy.is_shutdown()) and gamepad.isConnected():
        # eventType, control, value = gamepad.getNextEvent()
        v[0]=-gamepad.axis('LEFT-Y') # [-1,1]
        v[1]=-gamepad.axis('LEFT-X') # [-1,1]
        if gamepad.beenPressed('L1'): # ascent
            v[2] = 1.0
        elif gamepad.beenReleased('L1'):
            v[2] = 0.0
        if v[2]==0.0 and gamepad.beenPressed('R1'):
            v[2] = -1.0
        elif gamepad.beenReleased('R1'):
            v[2] = 0.0

        if gamepad.beenPressed('CROSS'):
            open_hand_call()
            print("Gripper is opening")
        elif gamepad.beenPressed('SQUARE'):
            close_hand_call()
            print("Gripper is closing")

        # if gamepad.beenPressed('L2'):
        #     w_Z = 1.0
        # elif gamepad.beenReleased('L2'):
        #     w_Z = 0.0
        # if w_Z==0.0 and gamepad.beenPressed('R2'):
        #     w_Z = -1.0
        # elif gamepad.beenReleased('R2'):
        #     w_Z = 0.0
        # w_x = gamepad.axis('RIGHT-Y')*10    
        # # w_y = -gamepad.axis('RIGHT-X')*10
        # w_Z *= 10.0

        current_state, current_pose = get_current_state()
        
        # output_file_handler.write(str(current_state)+'\n')
        # rospy.loginfo("current position:"+np.array2string(current_pose[:3,-1]))

        target_pose = compute_target_pose(current_pose, v, w_x, w_y, w_Z, dt=dT)
        MoveArm(target_pose, current_state=current_state, current_pose=current_pose, time_from_start=dT)

        rate.sleep()
