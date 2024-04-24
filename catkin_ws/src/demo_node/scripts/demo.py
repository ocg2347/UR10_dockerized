#!/usr/bin/env python
import rospy
from std_msgs.msg import Float64MultiArray
from sensor_msgs.msg import JointState
from robotiq_3f_srvs.srv import Move

import tkinter as tk
from PIL import Image
import numpy as np

open_hand_call = rospy.ServiceProxy('/robotiq_3f_gripper/open_hand', Move)
close_hand_call = rospy.ServiceProxy('/robotiq_3f_gripper/close_hand', Move)
    

flag_open=0 



root = tk.Tk()
root.geometry("800x800")

def orta_l1_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.6945417563067835, -1.8488853613482874, 0.057291336357593536, -1.1735299269305628, 1.534936547279358, -0.6933777968036097, 3]
    pub.publish(data_to_send)
    
def sag_l1_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.7040131727801722, -1.8408272902118128, 0.24774876236915588, -1.1769326368915003, 1.5364964008331299, -0.5027263800250452, 3]
    pub.publish(data_to_send)
    
def sol_l1_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.6314895788775843, -1.8963468710528772, -0.1188576857196253, -1.1843259970294397, 1.533677101135254, -0.8700149695025843, 3]
    pub.publish(data_to_send)
    
def ileri_l1_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.6571720282184046, -1.8751347700702112, 0.41938307881355286, -1.1935647169696253, 1.537804126739502, -0.33125478426088506]
    pub.publish(data_to_send)
    
#------------------------------------------------------------

def orta_l08_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.7640164534198206, -1.8994162718402308, 0.06793108582496643, -1.0538867155658167, 1.5341928005218506, -0.6833060423480433]
    pub.publish(data_to_send)
    
def sag_l08_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.7715008894549769, -1.8931687513934534, 0.24790455400943756, -1.057169262562887, 1.535536527633667, -0.5032179991351526]
    pub.publish(data_to_send)
    
def sol_l08_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.6872137228595179, -1.9537351767169397, -0.13896495500673467, -1.0705750624286097, 1.532813549041748, -0.8908188978778284]
    pub.publish(data_to_send)
    
def ileri_l08_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.6872137228595179, -1.9537351767169397, -0.13896495500673467, -1.0705750624286097, 1.532813549041748, -0.8908188978778284]
    pub.publish(data_to_send)
    
#------------------------------------------------------------
    
def orta_l07_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.8102996985064905, -1.9546945730792444, 0.0652979239821434, -0.9521144072162073, 1.533197045326233, -0.6867306868182581,3]
    pub.publish(data_to_send)
    
def sag_l07_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.8184436003314417, -1.9483993689166468, 0.2480839490890503, -0.954989258443014, 1.5346006155014038, -0.5038045088397425,3]
    pub.publish(data_to_send)
    
def sol_l07_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.7351344267474573, -2.00485068956484, -0.1355660597430628, -0.9717701117144983, 1.5319734811782837, -0.8881600538836878,3]
    pub.publish(data_to_send)
    
    
def ileri_l07_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.7712252775775355, -1.9790833632098597, 0.4189520478248596, -0.975807015095846, 1.5361125469207764, -0.33303958574403936]

    pub.publish(data_to_send)
    
#------------------------------------------------------------
    
def orta_l05_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.823329273854391, -1.9772008101092737, 0.06015144661068916, -0.9165175596820276, 1.532717227935791, -0.6922286192523401,3]
    pub.publish(data_to_send)
    
def sag_l05_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.8315923849688929, -1.970990006123678, 0.25746646523475647, -0.9194639364825647, 1.5343729257583618, -0.4947746435748499,3]
    pub.publish(data_to_send)
    
def sol_l05_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.749012295399801, -2.0255821386920374, -0.13551837602724248, -0.9371779600726526, 1.5315536260604858, -0.8883760611163538,3]
    pub.publish(data_to_send)
    
def ileri_l05_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.7971871534930628, -2.020953957234518, 0.4191078245639801, -0.9079421202289026, 1.5354886054992676, -0.33354217210878545]
    pub.publish(data_to_send)
    
#------------------------------------------------------------
    
def orta_l0_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.8529089132892054, -2.0292509237872522, 0.07198812067508698, -0.8350661436664026, 1.5321651697158813, -0.6811378637896937, 3]
    pub.publish(data_to_send)
    
def sag_l0_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.8589451948748987, -2.0248029867755335, 0.25762227177619934, -0.838287655507223, 1.533484935760498, -0.49520618120302373,3]
    pub.publish(data_to_send)
    
def sol_l0_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.7785418669330042, -2.0797646681415003, -0.133399788533346, -0.8534610907184046, 1.5309057235717773, -0.8870103994952601,3]
    pub.publish(data_to_send)
    
def ileri_l0_CallBack():
    data_to_send = Float64MultiArray() 
    data_to_send.data= [-1.8345144430743616, -2.0391786734210413, 0.3638264834880829, -0.8510416189776819, 1.5343610048294067, -0.38899070421327764]
    pub.publish(data_to_send)
    
#------------------------------------------------------------    

def OpenCallBack():
    rospy.loginfo("TODO: Gripper open")
    open_hand_call()
    
def CloseCallBack():
    rospy.loginfo("TODO: Gripper close")
    close_hand_call()
    
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

#level 0



sol_l0 = tk.Button(root, text ="sol 0", command = sol_l0_CallBack)
sol_l0.grid(row=8, column=0, pady=20, padx = 20)

orta_l0 = tk.Button(root, text ="orta 0", command = orta_l0_CallBack)
orta_l0.grid(row=8, column=1, pady=20, padx = 20)

sag_l0 = tk.Button(root, text ="sag 0", command = sag_l0_CallBack)
sag_l0.grid(row=8, column=2, pady=20, padx = 20)


ileri_l0 = tk.Button(root, text ="ileri 0", command = ileri_l0_CallBack)
ileri_l0.grid(row=8, column=3, pady=20, padx = 20)

#level 0.5

sol_l05 = tk.Button(root, text ="sol 1", command = sol_l05_CallBack)
sol_l05.grid(row=9, column=0, pady=20, padx = 20)

orta_l05 = tk.Button(root, text ="orta 1", command = orta_l05_CallBack)
orta_l05.grid(row=9, column=1, pady=20, padx = 20)

sag_l05 = tk.Button(root, text ="sag 1", command = sag_l05_CallBack)
sag_l05.grid(row=9, column=2, pady=20, padx = 20)

ileri_l05 = tk.Button(root, text ="ileri 1", command = ileri_l05_CallBack)
ileri_l05.grid(row=9, column=3, pady=20, padx = 20)

#level07

sol_l07 = tk.Button(root, text ="sol 2", command = sol_l07_CallBack)
sol_l07.grid(row=10, column=0, pady=20, padx = 20)

orta_l07 = tk.Button(root, text ="orta 2", command = orta_l07_CallBack)
orta_l07.grid(row=10, column=1, pady=20, padx = 20)

sag_l07 = tk.Button(root, text ="sag 2", command = sag_l07_CallBack)
sag_l07.grid(row=10, column=2, pady=20, padx = 20)


ileri_l07 = tk.Button(root, text ="ileri 2", command = ileri_l07_CallBack)
ileri_l07.grid(row=10, column=3, pady=20, padx = 20)

#level 08



sol_l08 = tk.Button(root, text ="sol 3", command = sol_l08_CallBack)
sol_l08.grid(row=11, column=0, pady=20, padx = 20)

orta_l08 = tk.Button(root, text ="orta 3", command = orta_l08_CallBack)
orta_l08.grid(row=11, column=1, pady=20, padx = 20)

sag_l08 = tk.Button(root, text ="sag 3", command = sag_l08_CallBack)
sag_l08.grid(row=11, column=2, pady=20, padx = 20)

ileri_l08 = tk.Button(root, text ="ileri 3", command = ileri_l08_CallBack)
ileri_l08.grid(row=11, column=3, pady=20, padx = 20)


#level 1



sol_l1 = tk.Button(root, text ="sol 4", command = sol_l1_CallBack)
sol_l1.grid(row=12, column=0, pady=20, padx = 20)

orta_l1 = tk.Button(root, text ="orta 4", command = orta_l1_CallBack)
orta_l1.grid(row=12, column=1, pady=20, padx = 20)

sag_l1 = tk.Button(root, text ="sag 4", command = sag_l1_CallBack)
sag_l1.grid(row=12, column=2, pady=20, padx = 20)


ileri_l1 = tk.Button(root, text ="ileri 4", command = ileri_l1_CallBack)
ileri_l1.grid(row=12, column=3, pady=20, padx = 20)


data_to_send = Float64MultiArray()  # the data to be sent, initialise the array
 
while not rospy.is_shutdown():
    root.update_idletasks()
    root.update()
    if flag_open==1:
        data_to_send.data = [w0.get(),w1.get(),w2.get(),w3.get(),w4.get(),w5.get(), 5]
        talker(data_to_send)
        rate.sleep()
