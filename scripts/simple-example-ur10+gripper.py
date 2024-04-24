from igor.UR10_robot_interface import ur10_interface_moveit    # rember to lauch the nodes as in the instructions
from igor.Gripper3F_interface import gripper3f_interface   # rember to launch the nodes as in the instructions
import rospy

rospy.init_node("example")
rospy.sleep(2.0)
#initialize
robot = ur10_interface_moveit.UR10()
gripper = gripper3f_interface.Gripper()
rospy.sleep(2.0)
#activate
gripper.activate_gripper()
print('gripper activated\n')

#execute
pos=robot.get_joint_position()
print('robot position:\n',pos)
pos_cart=robot.get_cartesian_position()
print('robot cartesian position:\n',pos_cart)

print('set gripper in pinch mode')
gripper.set_mode("pinch")

print('set gripper speed and torque')
gripper.set_speed(50)
gripper.set_torque(2)

grip_position=gripper.get_position()
print('gripper position: ',grip_position)

print('set gripper position')
gripper.set_position(100)
rospy.sleep(3.0)

print('open gripper')
gripper.open_gripper()

print('press enter button to go table pose')
input()
robot.table_pose()
rospy.sleep(2.0)

print("going to zero pose")
robot.zero_pose()