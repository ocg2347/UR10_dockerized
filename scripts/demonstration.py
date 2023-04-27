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

TASKSPACE_LIMITS = {'x':[-1.29, -0.62],'y':[-0.35, 0.6],'z':[0.24, 0.7]} # very very safe ;)
MAX_LIN_SPEED_TOOL = 0.05 # m/s

rospy.init_node('gui', anonymous=True)
pub = rospy.Publisher('radian', Float64MultiArray, queue_size=10)

MAX_LIN_SPEED_TOOL = 0.05 # m/s
ROS_INTERFACE_RATE = 10 # Hz

dt = 1/ROS_INTERFACE_RATE
rate = rospy.Rate(ROS_INTERFACE_RATE) # 10hz   
ur10_arm = ur_kinematics.URKinematics('ur10')
joint_order = [2, 1, 0, 3, 4, 5]

def get_current_state(return_pose=True):
    current_state = rospy.wait_for_message("/joint_states", JointState)
    current_state_lst = [current_state.position[i] for i in joint_order]
    pose_matrix=None
    if return_pose:
        pose_matrix= ur10_arm.forward(current_state_lst, 'matrix')
    return current_state_lst, pose_matrix

if __name__=='__main__':
    # open a file with name given by first argument
    if sys.argv[1]=="collect":
        output_file = open(sys.argv[2], 'w')
        while not rospy.is_shutdown():
            current_state, current_pose = get_current_state()
            rospy.loginfo(current_state)
            output_file.write(str(current_state)+'\n')
            output_file.flush()
            rate.sleep()
    if sys.argv[1]=="play":
        current_state, current_pose = get_current_state()
        rospy.loginfo(current_state)
        input_file = open(sys.argv[2], 'r')
        # get initial state from the file:
        traj = []
        for state in input_file:
            state= [float(i) for i in state[1:-2].split(',')]
            state = [state[i] for i in joint_order]
            traj.append(state)
        # execute trajectory in reverse order
        for state in reversed(traj):
            pub.publish(Float64MultiArray(data=state+[dt]))
            rate.sleep()