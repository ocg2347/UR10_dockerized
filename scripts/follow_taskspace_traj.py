#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray
from sensor_msgs.msg import JointState
# from ur_ikfast import ur_kinematics
from scipy.spatial.transform import Rotation as R
import tkinter as tk
from PIL import Image
import numpy as np
import time
from gamepad import Gamepad
from robotiq_3f_srvs.srv import Move
import _thread

rospy.init_node('gui', anonymous=True)
pub = rospy.Publisher('radian', Float64MultiArray, queue_size=10)

# joint_order = [2, 1, 0, 3, 4, 5]
# ur10_arm = ur_kinematics.URKinematics('ur10')

# tool_length = 0.2 #distance from ur10 end and tool center

# TASKSPACE_LIMITS = {'x':[-1.29, -0.62],'y':[-0.35, 0.6],'z':[0.24, 0.7]} # very very safe ;)
MAX_LIN_SPEED_TOOL = 0.1 # m/s
ROS_INTERFACE_RATE = 10 # Hz


dt = 1/ROS_INTERFACE_RATE
rate = rospy.Rate(ROS_INTERFACE_RATE) # 10hz   

# def get_current_state():
#     current_state = rospy.wait_for_message("/joint_states", JointState)
#     current_state_lst = [current_state.position[i] for i in joint_order]
#     pose_matrix= ur10_arm.forward(current_state_lst, 'matrix')
#     return current_state_lst, pose_matrix

# def MoveArm(target_pose, current_pose=None, current_state=None, dx=0.01, time_from_start=1):
#     # theta target is ['x','y','Z'] first two are extrinsic euler angles, last one is intrinsic
#     # target_pose and current_pose are 3x4 matrices !!!
#     dtheta=(1/2*np.pi)/time_from_start

#     if current_pose is None or current_state is None:
#         current_state, current_pose = get_current_state()
#     p_initial = current_pose[:3,-1]
#     p_target = target_pose[:3,-1]
#     target_distance = np.linalg.norm(p_target-p_initial)
#     target_speed = target_distance/time_from_start  
#     # check if speed demand is within limits
#     if target_speed>MAX_LIN_SPEED_TOOL:
#         return
#     # rospy.loginfo("target pos:"+str(p_target))
#     n_steps=max(2, int(abs(target_distance)/dx)+1)
#     # dont allow to go beyond task space limits!
#     for idx, axis in enumerate(['x','y','z']):
#         p_target[idx] = max(TASKSPACE_LIMITS[axis][0], p_target[idx])
#         p_target[idx] = min(TASKSPACE_LIMITS[axis][1], p_target[idx])

#     p_vals = np.linspace(p_initial, p_target, n_steps)[1:]

#     # get euler angles from pose matrix
#     current_euler = R.from_matrix(current_pose[:3,:3]).as_euler('xyz', degrees=False)
#     target_euler = R.from_matrix(target_pose[:3,:3]).as_euler('xyz', degrees=False)
#     idx_max_angle_change = np.argmax(np.abs(target_euler-current_euler))
#     n_steps2 = max(2, int(abs(target_euler[idx_max_angle_change]-current_euler[idx_max_angle_change])/dtheta)+1)
#     n_steps = max(n_steps, n_steps2)
    
#     int_eulers = np.linspace(current_euler, target_euler, n_steps)[1:] # intermediate euler angles
#     p_vals = np.linspace(p_initial, p_target, n_steps)[1:]

#     rospy.loginfo("intermediate_p_vals:"+np.array2string(p_vals))
#     data_to_send = Float64MultiArray()

#     new_pose = current_pose
#     for p_target_i, euler_i in zip(p_vals, int_eulers):
#         new_pose[:3,-1] = p_target_i
#         new_pose[:3,:3] = R.from_euler('xyz', euler_i, degrees=False).as_matrix()
#         new_joint_pos = ur10_arm.inverse(new_pose, False, q_guess=current_state)
#         if new_joint_pos is not None:
#             # rospy.loginfo("going to "+np.array2string(new_pose))
#             data_to_send.data = [new_joint_pos[i] for i in joint_order]+[time_from_start/n_steps]
#             pub.publish(data_to_send)
#         else:
#             rospy.loginfo("cant find solution for the orientation:"+np.array2string(euler_i))

# """
# # UI Stuff
# ui_root = tk.Tk()
# x_label = tk.Label(ui_root, text='X').grid(row=3, column=1)
# x_minus = tk.Button(ui_root, text ="-", command = lambda:TranslateInOneAxis('x',-0.05)).grid(row=4, column=0, pady=40, padx = 40)
# x_plus  = tk.Button(ui_root, text ="+", command = lambda:TranslateInOneAxis('x',0.05)).grid(row=4, column=2, pady=40, padx = 40)
# y_label = tk.Label(ui_root, text='Y').grid(row=5, column=1)
# y_minus = tk.Button(ui_root, text ="-", command = lambda:TranslateInOneAxis('y',-0.05)).grid(row=6, column=0, pady=40, padx = 40)
# y_plus  = tk.Button(ui_root, text ="+", command = lambda:TranslateInOneAxis('y',0.05)).grid(row=6, column=2, pady=40, padx = 40)
# z_label = tk.Label(ui_root, text='Z').grid(row=7, column=1)
# z_minus = tk.Button(ui_root, text ="-", command = lambda:TranslateInOneAxis('z',-0.05)).grid(row=8, column=0, pady=40, padx = 40)
# z_plus  = tk.Button(ui_root, text ="+", command = lambda:TranslateInOneAxis('z',0.05)).grid(row=8, column=2, pady=40, padx = 40)
# """

# def RotateAboutOneAxis(axis, deg_angle, dtheta=0.01, time_from_start=1,n_steps=100):
#     # get initial state
#     current_state = rospy.wait_for_message("/joint_states", JointState)
#     current_state_lst = [current_state.position[i] for i in joint_order]
#     rospy.loginfo("initial joint config:"+str(current_state_lst))
#     # compute initial pose
#     pose_matrix= ur10_arm.forward(current_state_lst, 'matrix')
#     rospy.loginfo('intial pose:'+np.array2string(pose_matrix))
#     # apply rotation to current rotation matrix and get the target pose!
#     r = R.from_euler(axis, deg_angle, degrees=True).as_matrix()
#     new_rot = np.dot(r, pose_matrix[:3,:3])
#     new_pose = pose_matrix
#     new_pose[:3,:3] = new_rot
#     rospy.loginfo('target pose:'+ np.array2string(new_pose))
#     # get the target joint positions
#     target_joint_pos = ur10_arm.inverse(new_pose, False, q_guess=current_state_lst)
#     rospy.loginfo("target joint config:"+np.array2string(target_joint_pos))
#     # send it
#     data_to_send = Float64MultiArray()
#     data_to_send.data = [target_joint_pos[i] for i in joint_order]+[time_from_start]
#     pub.publish(data_to_send)

#     # check if it is realised!
#     new_state = rospy.wait_for_message("/joint_states", JointState)
#     new_state_list = [new_state.position[i] for i in joint_order]
#     new_pose = ur10_arm.forward(new_state_list, 'matrix')
#     rospy.loginfo('realised joint config:'+str(new_state_list))

# # todo: guarantee that speed is not higher when going in diagonal direction!
# def compute_target_pose(current_pose, v, w_x, w_y, w_Z, dt):
#     # compute the target position
#     p_initial = current_pose[:3,-1]
#     target_speed = (np.linalg.norm(v)/np.sqrt(3.0))*MAX_LIN_SPEED_TOOL
#     target_distance = target_speed*dt
#     p_target = p_initial + target_distance*(v/(np.linalg.norm(v)+1e-5))
#     # compute the target orientation
#     R_initial = current_pose[:3,:3]
#     R_target = R_initial
#     R_target = np.dot(R_target, R.from_euler('x', w_x*dt, degrees=True).as_matrix())
#     R_target = np.dot(R_target, R.from_euler('y', w_y*dt, degrees=True).as_matrix())
#     R_target = np.dot(R.from_euler('Z', w_Z*dt, degrees=True).as_matrix(), R_target)
#     target_pose = np.zeros((3,4), dtype=np.float32)
#     target_pose[:3,:3] = R_target
#     target_pose[:,-1] = p_target
#     return target_pose

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
def control_gripper():
    while (not rospy.is_shutdown()) and gamepad.isConnected():
        if gamepad.beenPressed('CROSS'):
            open_hand_call()
            print("Gripper is opening")
        elif gamepad.beenPressed('SQUARE'):
            close_hand_call()
            print("Gripper is closing")
    time.sleep(3.0)

# _thread.start_new_thread(control_gripper, ())

v = np.array([0.0, 0.0, 0.0], dtype=np.float32)

w_Z = 0.0
w_x = 0.0
w_y = 0.0
dT  = 1.0
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

    if gamepad.beenPressed('L2'):
        w_Z = 1.0
    elif gamepad.beenReleased('L2'):
        w_Z = 0.0
    if w_Z==0.0 and gamepad.beenPressed('R2'):
        w_Z = -1.0
    elif gamepad.beenReleased('R2'):
        w_Z = 0.0
    w_x = gamepad.axis('RIGHT-X')*10    
    w_Z *= 10.0
    w_y = gamepad.axis('RIGHT-Y')*10

    # current_state, current_pose = get_current_state()
    # target_pose = compute_target_pose(current_pose, v, w_x, w_y, w_Z, dt=dT)
    # MoveArm(target_pose, current_state=current_state, current_pose=current_pose, time_from_start=dT)
    rate.sleep()

# while not rospy.is_shutdown():
#     ui_root.update_idletasks()
#     ui_root.update()
#     rate.sleep()