#!/bin/bash

# Start the first process
roslaunch ur_robot_driver ur10_bringup.launch robot_ip:=192.168.0.111 kinematics_config:=ur10colors_calibration.yaml &

# Start the second process
rosrun demo_node demo_node &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?