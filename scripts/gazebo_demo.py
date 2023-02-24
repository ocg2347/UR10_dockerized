#!/usr/bin/env python

import rospy
import tf2_ros
import tf2_geometry_msgs
from gazebo_msgs.msg import ModelState
from std_msgs.msg import Empty
from geometry_msgs.msg import PoseStamped

from manipulator import UR10
from planning_scene import Scene


class TestRunner:
    def __init__(self) -> None:
        self.box_offset = 0.05
        self.red_block_pose = ([0.7, 0.4, 1.2], [135, 135, 0])
        self.red_bin_pose = ([0.1, 0.5, 1.2], [135, 135, 0])

        self.robot = UR10("/pos_joint_traj_controller/command")
        self.scene = Scene()
        rospy.sleep(2)

        self.scene.lab_setup()

        position = self.robot.get_joint_position()
        print(f'position: {position}')

        self.robot.home_pose()

        self.pose_pub = rospy.Publisher('/gazebo/set_model_state', ModelState, queue_size=1)
        # self.pose_sub = rospy.Subscriber('/gazebo/model_states', ModelState, self.pose_cb)
        self.attach_sub = rospy.Subscriber('/attach', Empty, self.attach)
        self.detach_sub = rospy.Subscriber('/detach', Empty, self.detach)

        self.is_attached = False

        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(100))
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

    def run_test(self):
        rospy.loginfo('test starting...')
        # TODO: make this parametric so block poses are received from a subscriber

        # move to red block
        result = self.robot._compute_ik(self.red_block_pose[0], self.red_block_pose[1])  # red block's pose
        self.robot.set_joint_position(result, blocking=True)
        

        rospy.loginfo('grasping...')
        rospy.sleep(0.5)

        self.attach(Empty())

        # move over to bin
        result = self.robot._compute_ik(self.red_bin_pose[0], self.red_bin_pose[1])  # red bin's pose
        self.robot.set_joint_position(result, blocking=False)
        
        ms = ModelState()
        ms.model_name = 'red_box_0_1'
        ms.reference_frame = 'world'

        target_frame = 'tool0'
        pose_stamped = PoseStamped()
        pose_stamped.header.frame_id = target_frame
        # transform box_pose (tool0_pose + 5cm) in tool frame's z axis
        pose_stamped.pose.position.z = 0.05
        while self.is_attached:
            try:
                transform = self.tf_buffer.lookup_transform('world', target_frame, rospy.Time(0))
            except:
                rospy.logwarn('No transform found: world --> tool0')
                return

            pose_transformed = tf2_geometry_msgs.do_transform_pose(pose_stamped, transform)

            ms.pose = pose_transformed.pose
            self.pose_pub.publish(ms)
            
        rospy.sleep(1)
        self.robot.home_pose()

        rospy.loginfo('test finished.')


    def attach(self, msg):
        self.is_attached = True  # TODO: if close enough

    def detach(self, msg):
        self.is_attached = False


if __name__ == '__main__':
    try:
        rospy.init_node("ur10_test", anonymous=True)
        tr = TestRunner()
        tr.run_test()
    except rospy.ROSInterruptException:
        pass