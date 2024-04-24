## UR10 driver and interface
Throughout this document, every terminal is assumed to have sourced the catkin worspace (``source catkin_ws/devel/setup.bash``) and the conda environment is activated (``conda activate ur10_py3.9``).

## 1. How to run

You have UR10 robot up and have run external control program (rosdriver.urp) using the pendant. You got ip of the robot as well. How can we communicate with it? First source the catkin_ws, then activate the conda env. After that run the UR10 driver:

```bash
roslaunch ur_robot_driver ur10_bringup.launch robot_ip:=$robot_ip kinematics_config:=ur10colors_calibration.yaml 
```
If you want to recalibrate it, run the following before running the driver:

```bash
roslaunch ur_calibration calibration_correction.launch target_filename:=ur10colors_calibration.yaml robot_ip:=$robot_ip
```
Then, simply run the program on the robot by pressing the tiny "play" button in program screen. You have to see "Ready to receive control commands" in the terminal where the driver is running to send control commands. Now you can see the topics created by running ``rostopic list`` in a new terminal.

## 2. State
You can read the state of the robot by 'subscribing' the ``/joint_states`` which has message type ``JointState``. You can then solve forward kinematics to get the pose of the end of UR10 (Where tools are attached to).

```python
from ur_ikfast import ur_kinematics
import rospy

rospy.init_node('read_state')
ur10_arm = ur_kinematics.URKinematics('ur10')
joint_order = [2, 1, 0, 3, 4, 5]

# Now read and reorder the joint angles, then compute forward kinematics.
current_state = rospy.wait_for_message("/joint_states", JointState)
current_state_lst = [current_state.position[i] for i in joint_order]
pose_matrix= ur10_arm.forward(current_state_lst, 'matrix') # matrix is not the only option
```

## 3. Follow a joint trajectory - position and/or velocity
Two ways are possible:

1. You can send joint position trajectory commands by 'publishing' to ``/scaled_pos_joint_traj_controller/command`` with ``JointTrajectory`` message type.
2. You can create a 'ActionGoal' by 'publishing' to ``/scaled_pos_joint_traj_controller/follow_joint_trajectory/goal`` with message type of ``FollowJointTrajectoryActionGoal``. Then you can check the status by 'subscribing' to ``/scaled_pos_joint_traj_controller/follow_joint_trajectory/status``

Both are wrapper (or container class let's say) around JointTrajectoryPoint which contains joint names, angular positions and velocities of the joints and time_from_start.

## 4. (Almost) All-in-One Wrapper
We have two different implementations for wrapping UR10 control: one utilizes moveit planner, and one without it. You can use part of the functionalities described in 2 and 3 with ur10_interfaces package that is developed in-house:

```python
from ur10_interfaces.ur10_interface import UR10
import rospy

rospy.init_node("ur10_controller")

robot = UR10()

joint_states = robot.get_joint_position() # read state
robot.set_joint_position([-0.015, -1.7569, -1.3694, -1.4978, 1.7183, -2.4595]) # set single-point joint state target for robot to execute
```

or you can get cartesian positions and set cartesian goals for robot end using the ur10_moveit_interface module. First run moveit in a new terminal:

```bash
roslaunch ur10_moveit_config moveit_planning_execution.launch
```

then instantiate UR10 from ur10_moveit_interface module. Example:

```python
from ur10_interfaces.ur10_moveit_interface import UR10
import rospy

rospy.init_node("ur10_controller")

robot = UR10()

joint_states = robot.get_joint_position() # read joint state
cartesian_pos = robot.get_cartesian_position() # fetches joint states and computes forward kinematics using moveit, returns it
robot.set_cartesian_position([...]) # takes pose array, interpolates between current and set pose, plans with these waypoints using moveit, executes the plan.
```

NOTE: This classes lacks passing full joint trajectory (multiple timesteps) at the moment.


Thanks to [@igor_lirussi](https://github.com/igor-lirussi/UR10_robot_interface) for these wrappers.
