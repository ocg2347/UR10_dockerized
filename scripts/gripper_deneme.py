import rospy

from robotiq_3f_srvs.srv import Move

rospy.init_node('gripper_py', anonymous=True)
# rospy.wait_for_service('/robotiq_3f_gripper', open_hand)
ser_call = rospy.ServiceProxy('/robotiq_3f_gripper/open_hand', Move)

resp = ser_call()
print("Gripper is opening")