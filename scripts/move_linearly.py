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
from gamepad_control import get_current_state
import subprocess

rospy.init_node('gui', anonymous=True)
pub = rospy.Publisher('radian', Float64MultiArray, queue_size=10)
time.sleep(1)
joint_order = [2, 1, 0, 3, 4, 5]
ur10_arm = ur_kinematics.URKinematics('ur10')

TASKSPACE_LIMITS = {'x':[-1.29, -0.62],'y':[-0.35, 0.6],'z':[0.20, 0.7]} # very very safe ;)
MAX_LIN_SPEED_TOOL = 0.05 # m/s
ROS_INTERFACE_RATE = 10 # Hz

dt = 1/ROS_INTERFACE_RATE
rate = rospy.Rate(ROS_INTERFACE_RATE) # 10hz   

def MoveArm(target_pose, current_pose, current_state=None, dT=10):
    new_joint_pos = ur10_arm.inverse(target_pose, False, q_guess=current_state)
    if new_joint_pos is not None:
        data_to_send = Float64MultiArray()
        data_to_send.data = [new_joint_pos[i] for i in joint_order]+[dT]
        rospy.loginfo(data_to_send.data)
        pub.publish(data_to_send)
    else:
        rospy.loginfo("No IK solution found")


if __name__=="__main__":
    filename = sys.argv[2]
    # start position
    start_pos = np.array([[ 0.69818693, -0.71579009,  0.01339897, -0.65349942],
        [-0.71581429, -0.69828063, -0.00374937,  0.10678106], \
        [ 0.01204,    -0.00697341, -0.9999032,   0.39390004]])
    
    # move to start position
    current_state, current_pose = get_current_state()
    MoveArm(target_pose=start_pos, current_state=current_state, current_pose=current_pose, dT=5)
    time.sleep(6)
    input("Press Enter to continue...")
    # start to save joint positions to a file in a subprocess
    # start_recording()

    
    # move to top of the cup
    via_point_pos = start_pos.copy()
    via_point_pos[:3,-1] = np.array([-0.84871817, 0.10750604, 0.39390004])
    current_state, current_pose = get_current_state()

    proc = subprocess.Popen(["python", "record_joint_states.py",filename])
    time.sleep(1)
    MoveArm(target_pose=via_point_pos, current_state=current_state, current_pose=current_pose, dT=3)
    time.sleep(3.5)

    # move to inside of the cup
    via_point_pos = via_point_pos.copy()
    via_point_pos[2,-1] = 0.19695364
    current_state, current_pose = get_current_state()
    MoveArm(target_pose=via_point_pos, current_state=current_state, current_pose=current_pose, dT=3)
    time.sleep(3.5)

    
    target_dir = float(sys.argv[1]) # in degrees
    theta = np.deg2rad(target_dir)
    
    # ---------------------------
    target_dist = 0.3
    dT = 3.0 # in seconds
    # ---------------------------

    current_state, current_pose = get_current_state()
    current_position = current_pose[:3,-1]
    target_position = current_position + target_dist*np.array([np.cos(theta), np.sin(theta), 0])
    rospy.loginfo(f"Current position: {current_position}")
    target_pose = current_pose.copy()
    target_pose[:3,-1] = target_position
    rospy.loginfo(f"Target position: {target_position}")

    MoveArm(target_pose, current_state=current_state, current_pose=current_pose, dT=dT)
    time.sleep(4)
    proc.kill()
    

