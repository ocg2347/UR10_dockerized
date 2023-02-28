#!/bin/bash

source /ur10_env/catkin_ws/devel/setup.bash
alias python="python3"

for argument; do 
    key=${argument%%=*}
    value=${argument#*=}

    if [ "$key" = "robot_ip" ] || [ "$key" = "--robot_ip" ]; then
        robot_ip=$value
    fi
    if [ "$key" = "gripper_ip" ] || [ "$key" = "--gripper_ip" ]; then
        gripper_ip=$value
    fi
done
echo "robot_ip: $robot_ip"
echo "gripper_ip: $gripper_ip"

# run robot driver if robot_ip is set else raise a warning
if [ -z "$robot_ip" ]; then
    echo "WARNING: robot_ip is not set, robot driver will not be started"
else
    roslaunch ur_robot_driver ur10_bringup.launch robot_ip:=${robot_ip} kinematics_config:=ur10colors_calibration.yaml &
fi

echo "wanna start gripper driver? (y/n)"
read answer

# run gripper driver if gripper_ip is set else raise a warning
if [ -z "$gripper_ip" ]; then
    echo "WARNING: gripper_ip is not set, gripper driver will not be started"
else
    roslaunch robotiq_3f_driver listener.launch ip_address:=${gripper_ip} &
fi

echo "wanna start demo node? (y/n)"
read answer

if [ "$answer" = "y" ]; then
    rosrun demo_node demo_node &
fi

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?