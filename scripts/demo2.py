import rospy
from manipulator import UR10
from planning_scene import Scene


rospy.init_node("ur10_deneme", anonymous=True)
robot = UR10("/pos_joint_traj_controller/command")
scene = Scene()
rospy.sleep(2)

scene.lab_setup()


position = robot.get_joint_position()
print(position)
# robot.zero_pose()
# robot.init_pose()

# position[4] += 0.5
# robot.set_joint_position(position, blocking=True)
# robot.zero_pose()

# result = robot._compute_ik([-0.05, 0.7, 1.5], [0, 0, 0])
# robot.set_joint_position(result, blocking=True)
# result = robot._compute_ik([0.7, -0.05, 1.5], [0, 0, 0])
# robot.set_joint_position(result, blocking=True)
# result = robot._compute_ik([-0.05, 0.7, 1.5], [0, 0, 0])
# robot.set_joint_position(result, blocking=True)
# result = robot._compute_ik([0.7, -0.05, 1.5], [0, 0, 0])
# robot.set_joint_position(result, blocking=True)
# result = robot._compute_ik([-0.05, 0.7, 1.5], [0, 0, 0])
# robot.set_joint_position(result, blocking=True)
# result = robot._compute_ik([0.7, -0.05, 1.5], [0, 0, 0])
# robot.set_joint_position(result, blocking=True)
robot.home_pose()

# result = robot._compute_ik([0.7, 0.4, 1.15], [135, 135, 0])
# robot.set_joint_position(result, blocking=True)

# result = robot._compute_ik([0.7, 0.4, 1.1], [135, 135, 0])
# robot.set_joint_position(result, blocking=True)

result = robot._compute_ik([0.1, 0.4, 1.2], [135, 135, 0])
robot.set_joint_position(result, blocking=True)