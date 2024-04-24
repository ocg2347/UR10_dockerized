#!/usr/bin/env python3
import time
import argparse
import rospy
import numpy as np
import csv
import os
from UR10_robot_interface import ur10_interface_moveit
from Gripper3F_interface import gripper3f_interface

parser = argparse.ArgumentParser()
parser.add_argument('-f', '--file', type=str, help='the file name to play to or path/filename, it has to be a .csv (1st column: time from 0 in ms, 4th column to 10th: endpoint position and orientation, 11th column: gripper position)')
parser.add_argument('-r', '--playback_rate', type=int, default='-1', help='milliseconds (default: -1, inferred from data) after which another point is played (es 100ms=10Hz), remember the update of robot is 100 Hz, so no lower than 10ms or values may be duplicated')
parser.add_argument('-gf', '--grip_on_force', action='store_true', help='Instead of commanding the gripper to a specific position, command the gripper to fully close only when gripper force is positive in the data (12th column) (add this argument to activate)')
parser.add_argument('-j', '--joints', action='store_true', help='Plays from the 6 joints positions in the last 6 column (columns 13th to 18th) (joint space) instead of the cartesian space (add this argument to activate)')
args = parser.parse_args()

FILENAME=args.file
PLAYBACKRATE=args.playback_rate

print("Loading file "+FILENAME)
if os.path.isfile(FILENAME) and FILENAME.endswith('.csv'):
    # Use numpy to load
    data = np.genfromtxt(FILENAME, delimiter=',', skip_header=1)
    print("FILE Loaded!")
    if len(data[0])<11:
        print("FILE INVALID for playback, not enough columns, check --help")
        exit()
else:
    print("FILENAME INVALID, check --help")
    exit()

if args.grip_on_force:
    print("playback WITH GRIP_ON_FORCE selected")
    if len(data[0])<12:
        print("FILE INVALID for playback with GRIP_ON_FORCE, not enough columns, check --help")
        exit()

if args.joints:
    print("playback WITH JOINT POSITIONS selected")
    if len(data[0])<18:
        print("FILE INVALID for playback with JOINTS, not enough columns, check --help")
        exit()


if PLAYBACKRATE==-1:
    print("Inferring playback rate....")
    PLAYBACKRATE=(data[-1,0]-data[0,0])/len(data)
print('Playback Rate: {}'.format(PLAYBACKRATE))

print('Initialize robot')
rospy.init_node("Playback")
rospy.sleep(2.0)
robot = ur10_interface_moveit.UR10()
gripper = gripper3f_interface.Gripper()

#print('Initialize gripper deactivated')
#gripper.activate_gripper()
rospy.sleep(4.0)


print('Get robot pose:')
p = robot.get_cartesian_position()
print('Current Position    x:%.2f y:%.2f z:%.2f'%(p[0],p[1],p[2]))
print('Current Orientation x:%.2f y:%.2f z:%.2f w:%.2f'%(p[3],p[4],p[5],p[6]))


print("\nMOVING TO FIRST POSITION!")
if args.joints:
    robot.set_joint_position([data[0, 12], data[0, 13], data[0, 14], data[0, 15], data[0, 16], data[0, 17]],blocking=True)
else:
    px = data[0, 3]
    py = data[0, 4]
    pz = data[0, 5]
    qx = data[0, 6]
    qy = data[0, 7]
    qz = data[0, 8]
    qw = data[0, 9]
    robot.set_cartesian_position([px, py, pz, qx, qy, qz, qw],blocking=True)
print("[info] Movement OK")
if args.grip_on_force:
    gripper_force = data[0, 11]
    if gripper_force > 0.1:
        gripper.close_gripper()
    else:
        gripper.open_gripper()
else:
    gripper_position = data[0, 10]
    gripper.set_position(int(gripper_position))
print("[info] Gripper OK")


rospy.sleep(1.0)
input("\nPress enter to start!\n")

print(f"\n -> Executing trajectory of {len(data)} points\n")
run=True
LAST_TIME=int(time.time_ns() / 1_000_000)
time_start_playback=int(time.time_ns() / 1_000_000)
index=0
while not rospy.is_shutdown() and run:
    NOW=int(time.time_ns() / 1_000_000)
    #if enough time passed
    if (NOW-LAST_TIME)>=PLAYBACKRATE:
        LAST_TIME=NOW
        #print info
        string_curr_point = f"({index} point, {data[index,0]} ms, ELAPSED: {int(time.time_ns() / 1_000_000)-time_start_playback} ms)"
        print(string_curr_point)
        #play the point
        if args.joints:
            robot.set_joint_position([data[index, 12], data[index, 13], data[index, 14], data[index, 15], data[index, 16], data[index, 17]],blocking=False) #best with robot speed 100%
        else:
            px = data[index, 3]
            py = data[index, 4]
            pz = data[index, 5]
            qx = data[index, 6]
            qy = data[index, 7]
            qz = data[index, 8]
            qw = data[index, 9]
            robot.set_cartesian_position([px, py, pz, qx, qy, qz, qw], blocking=False)
        if False: # gripper deactivated because it exposes blocking services and slows down the code
            if args.grip_on_force:
                gripper_force = data[index, 11]
                if gripper_force > 0.1:
                    gripper.close_gripper()
                else:
                    gripper.open_gripper()
            else:
                gripper_position = data[index, 10]
                gripper.set_position(int(gripper_position))
        #point to next index    
        index=index+1

    if index>=len(data):
        run=False
        print("FINISHED")
rospy.sleep(1)
    