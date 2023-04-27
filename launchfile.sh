#!/bin/bash

source /ur10_env/catkin_ws/devel/setup.bash

alias python="python3"

for argument; do 
    key=${argument%%=*}
    value=${argument#*=}

    if [ "$key" = "robot_ip" ] || [ "$key" = "--robot_ip" ]; then
        robot_ip=$value
    elif [ "$key" = "gripper_ip" ] || [ "$key" = "--gripper_ip" ]; then
        gripper_ip=$value
    elif [ "$key" = "calibrate" ] || [ "$key" = "--calibrate" ]; then
        calibrate=$value
    fi
done
echo "robot_ip: $robot_ip"
echo "gripper_ip: $gripper_ip"

# if calibrate is set and robot_ip is set, run calibration
if [ -n "$calibrate" ] && [ -n "$robot_ip" ]; then
    echo "calibrating the robot..."
    roslaunch ur_calibration calibration_correction.launch target_filename:=${HOME}/ur10colors_calibration.yaml robot_ip:=${robot_ip} &
    wait -n
fi

# run robot driver if robot_ip is set else raise a warning
if [ -n "$robot_ip" ]; then
    roslaunch ur_robot_driver ur10_bringup.launch robot_ip:=${robot_ip} kinematics_config:=ur10colors_calibration.yaml &
else
    echo "WARNING: robot_ip is not set, robot driver will not be started"
fi

read answer

# run gripper driver if gripper_ip is set else raise a warning
if [ -n "$gripper_ip" ]; then
    roslaunch robotiq_3f_driver listener.launch ip_address:=${gripper_ip} &
else
    echo "WARNING: gripper_ip is not set, gripper driver will not be started"
fi

read answer

rosrun demo_node demo_node &

# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?