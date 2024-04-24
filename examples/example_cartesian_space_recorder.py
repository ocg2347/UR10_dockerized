#!/usr/bin/env python3
import time
import argparse
import rospy
import numpy as np
import csv  
from UR10_robot_interface import ur10_interface_moveit
from Gripper3F_interface import gripper3f_interface


parser = argparse.ArgumentParser()
parser.add_argument('-r', '--record_rate', type=int, default='100', help='milliseconds (default: 100ms=10Hz) after which another point is recorded, remember the update of robot is 100 Hz, so no lower than 10ms or values may be duplicated')
parser.add_argument('-f', '--file', type=str, default='data_record', help='the file name to record to or path/to/filename, (default: data_record) You can also omit the extension, they are gonna be saved anyway in .csv')
parser.add_argument('-l', '--limit', type=int, default='-1', help='limit on points to record (default -1, infinite) Useful to have the same amount of points in different recordings. Stops recording automatically once recorded an amount of points')
parser.add_argument('-j', '--joints', action='store_true', help='Saves also the 6 joints positions in the last 6 column (joint space) (add this argument to activate)')
args = parser.parse_args()

RECORDRATE=args.record_rate
FILENAME=args.file
if FILENAME.endswith('.csv'):
    FILENAME = FILENAME[:-4]

LAST_TIME=int(time.time_ns() / 1_000_000)

print('Initialize robot')
rospy.init_node("Recorder")
rospy.sleep(2.0)
robot = ur10_interface_moveit.UR10()
gripper = gripper3f_interface.Gripper()


print('Get robot pose:')
p = robot.get_cartesian_position()
print('Current Position    x:%.2f y:%.2f z:%.2f'%(p[0],p[1],p[2]))
print('Current Orientation x:%.2f y:%.2f z:%.2f w:%.2f'%(p[3],p[4],p[5],p[6]))

data = []
print("\n -> Press Enter to record")
print(" -> Press CTRL+C to stop recording")
print(" -> You can record now!\n")
input()

fullfilename = f"{FILENAME}_{time.strftime('%Y-%m-%d_%H-%M-%S')}.csv"
with open(fullfilename, mode='w', newline='') as file:
    writer = csv.writer(file)
    header_row=["Time","ROS secs","ROS nsecs", "________p_x________", "________p_y________", "________p_z________", "________q_x________", "________q_y________", "________q_z________", "________q_w________", "gripper_position", "gripper_force"]
    if args.joints: #if joints are recorded add in the end
        header_row += [ "shoulder_pan_joint","shoulder_lift_joint", "elbow_joint", "wrist_1_joint", "wrist_2_joint", "wrist_3_joint"]
    writer.writerow(header_row)  # Write header

    run=True
    time_start_record=int(time.time_ns() / 1_000_000)

    while not rospy.is_shutdown() and run:
        NOW=int(time.time_ns() / 1_000_000)
        if (NOW-LAST_TIME)>=RECORDRATE:
            LAST_TIME=NOW
            #add position and gripper data
            p = robot.get_cartesian_position()
            s = rospy.get_rostime()
            row = [NOW-time_start_record, s.secs, s.nsecs, p[0],p[1],p[2],p[3],p[4],p[5],p[6], gripper.get_position(), -1] # gripper force not present
            if args.joints: #if joints are recorded add in the end
                j_pos=robot.get_joint_position()
                row += [ j_pos[0],j_pos[1],j_pos[2],j_pos[3],j_pos[4],j_pos[5]]
            data.append(row)  # Append data to the list
            writer.writerow(row)  # Write data to the CSV file
            print('.', end='')
        #if limit passed
        if args.limit>0 and len(data)>=args.limit :
            print(f"({len(data)} points, {int(time.time_ns() / 1_000_000)-time_start_record}ms)")
            print("STOP RECORDING")
            run=False

    rospy.sleep(1)
    