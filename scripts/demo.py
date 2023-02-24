#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray
from sensor_msgs.msg import JointState

import tkinter as tk
from PIL import Image
import numpy as np

flag_open=0 



root = tk.Tk()
root.geometry("500x500")

def OpenCallBack():
    rospy.loginfo("TODO: Gripper open")
    
def CloseCallBack():
    rospy.loginfo("TODO: Gripper close")
    
def StartCallBack():
    global flag_open
    flag_open=1
    rospy.loginfo("Sending messages")
    
def StopCallBack():
    global flag_open
    flag_open=0
    rospy.loginfo("Stopped sending messages")
  

rospy.init_node('gui', anonymous=True)
pub = rospy.Publisher('radian', Float64MultiArray, queue_size=10)
data= rospy.wait_for_message("/joint_states", JointState)
rate = rospy.Rate(10) # 10hz

rospy.loginfo(data.position[0])
rospy.loginfo(data.position[1])
rospy.loginfo(data.position[2])
rospy.loginfo(data.position[3])
rospy.loginfo(data.position[4])
rospy.loginfo(data.position[5])
w0_value=data.position[0]
w1_value=data.position[1]
w2_value=data.position[2]
w3_value=data.position[3]
w4_value=data.position[4]
w5_value=data.position[5]
   
def talker(msg):        
    pub.publish(msg)
    
w0_label = tk.Label(root, text="Elbow Joint").grid(row=0, column=0, pady=4, padx = 4)
w0 = tk.Scale(root, from_=-3.1, to=3.1, orient='horizontal', length=250, resolution = 0.1 )
w0.set(w0_value)
w0.grid(row=0, column=1, pady=4, padx = 4)

w1_label = tk.Label(root, text="Shoulder Lift Joint").grid(row=1, column=0, pady=4, padx = 4)
w1 = tk.Scale(root, from_=-3.1, to=3.1, orient='horizontal', length=250, resolution = 0.1)
w1.set(w1_value)
w1.grid(row=1, column=1, pady=4, padx = 4)

w2_label = tk.Label(root, text="Shoulder Pan Joint").grid(row=2, column=0, pady=4, padx = 4)
w2 = tk.Scale(root, from_=-3.1, to=3.1, orient='horizontal', length=250, resolution = 0.1)
w2.set(w2_value)
w2.grid(row=2, column=1, pady=4, padx = 4)

w3_label = tk.Label(root, text="Wrist 1 Joint").grid(row=3, column=0, pady=4, padx = 4)
w3 = tk.Scale(root, from_=-3.1, to=3.1, orient='horizontal', length=250, resolution = 0.1)
w3.set(w3_value)
w3.grid(row=3, column=1, pady=4, padx = 4)

w4_label = tk.Label(root, text="Wrist 2 Joint").grid(row=4, column=0, pady=4, padx = 4)
w4 = tk.Scale(root, from_=-3.1, to=3.1, orient='horizontal', length=250, resolution = 0.1)
w4.set(w4_value)
w4.grid(row=4, column=1, pady=4, padx = 4)

w5_label = tk.Label(root, text="Wrist 3 Joint").grid(row=5, column=0, pady=4, padx = 4)
w5 = tk.Scale(root, from_=-3.1, to=3.1, orient='horizontal', length=250, resolution = 0.1)
w5.set(w5_value)
w5.grid(row=5, column=1, pady=4, padx = 4)

b0 = tk.Button(root, text ="Gripper Open", command = OpenCallBack)
b0.grid(row=6, column=0, pady=4, padx = 4)


b1 = tk.Button(root, text ="Gripper Close", command = CloseCallBack)
b1.grid(row=6, column=1, pady=4, padx = 4)


b2 = tk.Button(root, text ="Start Running", command = StartCallBack)
b2.grid(row=7, column=0, pady=40, padx = 40)


b3 = tk.Button(root, text ="Stop Running", command = StopCallBack)
b3.grid(row=7, column=1, pady=40, padx = 40)


data_to_send = Float64MultiArray()  # the data to be sent, initialise the array
 
while not rospy.is_shutdown():
    root.update_idletasks()
    root.update()
    if flag_open==1:
        data_to_send.data = [w0.get(),w1.get(),w2.get(),w3.get(),w4.get(),w5.get(), 1]
        talker(data_to_send)
        rate.sleep()
