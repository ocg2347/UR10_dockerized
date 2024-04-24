#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64MultiArray.h"
#include "trajectory_msgs/JointTrajectory.h"

trajectory_msgs::JointTrajectory traj;

ros::Publisher demo_node_pub ;
  
ros::Subscriber sub; 

void radianCallback(const std_msgs::Float64MultiArray::ConstPtr& msg)
{

  float radian0 = msg->data[0];
  float radian1 = msg->data[1];
  float radian2 = msg->data[2];
  float radian3 = msg->data[3];
  float radian4 = msg->data[4];
  float radian5 = msg->data[5];
  float time=msg->data[6];

  traj.points[0].positions[0] =radian0;
	traj.points[0].positions[1] =radian1;
	traj.points[0].positions[2] =radian2;
	traj.points[0].positions[3] =radian3;
	traj.points[0].positions[4] =radian4;
	traj.points[0].positions[5] =radian5;
	
	traj.points[0].time_from_start = ros::Duration(time);
  demo_node_pub.publish(traj);
  
}

int main(int argc, char **argv)
{
  
  ros::init(argc, argv, "demo_node");

  ros::NodeHandle n;

  ros::Rate loop_rate(10);
    
  //traj.header.frame_id = "base_link";
  traj.joint_names.resize(6);
  traj.points.resize(1);

  traj.points[0].positions.resize(6);

  traj.joint_names[0] ="elbow_joint";
  traj.joint_names[1] ="shoulder_lift_joint";
  traj.joint_names[2] ="shoulder_pan_joint";
  traj.joint_names[3] ="wrist_1_joint";
  traj.joint_names[4] ="wrist_2_joint";
  traj.joint_names[5] ="wrist_3_joint";
    
  demo_node_pub = n.advertise<trajectory_msgs::JointTrajectory>("/scaled_pos_joint_traj_controller/command", 10);
  
  sub = n.subscribe("radian", 10, radianCallback);

  int count = 0;
  while (ros::ok())
  {
    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}
