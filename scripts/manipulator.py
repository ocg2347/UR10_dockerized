import rospy
import moveit_commander
import numpy as np
from std_msgs.msg import Header
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Pose
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from scipy.spatial.transform import Rotation


class UR10:
    def __init__(self, topic_name="/arm_controller/command", rate=100):
        self.rate = rospy.Rate(100)
        self.joint_names = ["shoulder_pan_joint", "shoulder_lift_joint", "elbow_joint", "wrist_1_joint", "wrist_2_joint", "wrist_3_joint"]
        self._publisher = rospy.Publisher(topic_name, JointTrajectory, queue_size=10)
        self._jointsub = rospy.Subscriber("/joint_states", JointState, self._state_callback)
        self._pubtopic = topic_name
        self._joint_position = {}
        self._joint_velocity = {}
        self._init_angles = np.radians([0, -70, 115, -140, -90, 0])
        self.home_angles = np.array([0, -1.57, 1.57, 0, 0, 0])

        moveit_commander.roscpp_initialize([""])
        self._moveit_group = moveit_commander.MoveGroupCommander("manipulator")

    def get_joint_position(self):
        position = []
        for name in self.joint_names:
            position.append(self._joint_position[name])
        return position

    def set_joint_position(self, angles, time_from_start=5, blocking=False):
        if blocking:
            end_time = rospy.get_time() + time_from_start

        msg = JointTrajectory()
        msg.joint_names = self.joint_names
        msg.header.stamp = rospy.Time.now()
        point = JointTrajectoryPoint()
        point.positions = angles
        point.time_from_start = rospy.Duration(time_from_start)
        msg.points = [point]
        self._publisher.publish(msg)
        if blocking:
            while rospy.get_time() < end_time:
                self.rate.sleep()

    def set_joint_velocity(self, velocities, time_from_start=5, blocking=False):
        if blocking:
            end_time = rospy.get_time() + time_from_start

        msg = JointTrajectory()
        msg.joint_names = self.joint_names
        msg.header.stamp = rospy.Time.now()
        point = JointTrajectoryPoint()
        point.positions = self.get_joint_position()
        point.velocities = velocities
        point.time_from_start = rospy.Duration(time_from_start)
        msg.points = [point]
        self._publisher.publish(msg)
        if blocking:
            while rospy.get_time() < end_time:
                self.rate.sleep()

    def init_pose(self):
        self.set_joint_position(self._init_angles, blocking=True)

    def zero_pose(self):
        angles = np.radians([0, -90, 0, -90, 0, 0])
        self.set_joint_position(angles, blocking=True)

    def home_pose(self):
        self.set_joint_position(self.home_angles, blocking=True)

    def wobble(self, time):
        end_time = rospy.get_time() + time
        while rospy.get_time() < end_time:
            target_velocities = np.radians(np.random.uniform(-30, 30, (6,)))
            self.set_joint_velocity(target_velocities.tolist(), time_from_start=30*self.rate.sleep_dur.to_sec())
            self.rate.sleep()

    def _state_callback(self, msg):
        for name, pos, vel in zip(msg.name, msg.position, msg.velocity):
            self._joint_position[name] = pos
            self._joint_velocity[name] = vel

    def _compute_ik(self, position, rotation):
        quaternion = Rotation.from_euler("zyx", rotation).as_quat()
        pose_target = Pose()
        pose_target.position.x = position[0]
        pose_target.position.y = position[1]
        pose_target.position.z = position[2]
        pose_target.orientation.x = quaternion[0]
        pose_target.orientation.y = quaternion[1]
        pose_target.orientation.z = quaternion[2]
        pose_target.orientation.w = quaternion[3]
        self._moveit_group.set_pose_target(pose_target)
        plan = self._moveit_group.plan()
        target_angles = plan[1].joint_trajectory.points[-1].positions
        return target_angles
