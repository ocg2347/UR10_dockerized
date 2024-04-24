import sys
sys.path.insert(0, '/home/ur-colors/UR10_dockerized/scripts')
from igor.Gripper3F_interface import gripper3f_interface
import rospy


rospy.init_node("gripper")
rospy.sleep(2.0)
gripper = gripper3f_interface.Gripper()
rospy.sleep(2.0)

gripper.activate_gripper()
print('gripper activated')

gripper.open_gripper()
rospy.sleep(2.0)
gripper.close_gripper()
rospy.sleep(5.0)
gripper.open_gripper()
