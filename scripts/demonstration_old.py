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

ROS_INTERFACE_RATE = 10 # Hz

dt = 1/ROS_INTERFACE_RATE
rate = rospy.Rate(ROS_INTERFACE_RATE) # 10hz

joint_order = [2, 1, 0, 3, 4, 5]

def get_current_state():
    current_state = rospy.wait_for_message("/joint_states", JointState)
    current_state_lst = [current_state.position[i] for i in joint_order]
    return current_state_lst

if __name__=='__main__':
    # open a file with a filename given as the first argument
    if sys.argv[1]=="collect":
        output_file = open(sys.argv[2], 'w')
        try:
            while True:
                current_state = get_current_state()
                # rospy.loginfo("current state:")
                # rospy.loginfo(current_state)
                # rospy.loginfo("current pose:")
                # rospy.loginfo(current_pose)
                output_file.write(str(current_state)+'\n')
                rate.sleep()
        except KeyboardInterrupt:
            output_file.flush()

    if sys.argv[1]=="play":
        current_state = get_current_state()
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