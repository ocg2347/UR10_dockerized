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

# 1 - baslangic
# [INFO] [1686309678.229757]: current state:
# [INFO] [1686309678.230451]: [0.08751068264245987, -1.5922516028033655, -2.0044525305377405, -1.1287053267108362, 1.575702428817749, 2.456096887588501]
# [INFO] [1686309678.231135]: current pose:
# [INFO] [1686309678.232126]: [[ 0.69818693 -0.71579009  0.01339897 -0.65349942]
#  [-0.71581429 -0.69828063 -0.00374937  0.10678106]
#  [ 0.01204    -0.00697341 -0.9999032   0.39390004]]

# 3 - bardak ici
# [INFO] [1686309588.435144]: current state:
# [INFO] [1686309588.435947]: [0.06723674386739731, -2.0685904661761683, -1.7860024611102503, -0.871077839528219, 1.5670523643493652, 2.4321370124816895]
# [INFO] [1686309588.436707]: current pose:
# [INFO] [1686309588.437649]: [[ 0.70090413 -0.71313703  0.01299974 -0.84871817]
#  [-0.71323186 -0.70091289  0.00462781  0.10750604]
#  [ 0.00581142 -0.01251548 -0.99990481  0.19695364]]

if __name__=='__main__':
    # open a file with name given by first argument
    if sys.argv[1]=="collect":
        output_file = open(sys.argv[2], 'w')
        while not rospy.is_shutdown():
            current_state, current_pose = get_current_state()
            rospy.loginfo("current state:")
            rospy.loginfo(current_state)
            rospy.loginfo("current pose:")
            rospy.loginfo(current_pose)
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