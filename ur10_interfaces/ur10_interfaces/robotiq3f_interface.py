import rospy
import numpy as np
from robotiq_3f_srvs.srv import Activate,Reset,Move,SetMode,GetMode,SetPosition,GetPosition,SetSpeed,GetSpeed,SetTorque,GetTorque


class Gripper:
    def __init__(self):
        # wait for services to be active
        print("Waiting for gripper services, ros node exposes them, rememember to launch it")
        rospy.wait_for_service("/robotiq_3f_gripper/activate")
        rospy.wait_for_service("/robotiq_3f_gripper/reset")
        rospy.wait_for_service("/robotiq_3f_gripper/close_hand")
        rospy.wait_for_service("/robotiq_3f_gripper/open_hand")
        rospy.wait_for_service("/robotiq_3f_gripper/set_mode")
        rospy.wait_for_service("/robotiq_3f_gripper/get_mode")
        rospy.wait_for_service("/robotiq_3f_gripper/set_position")
        rospy.wait_for_service("/robotiq_3f_gripper/get_position")
        rospy.wait_for_service("/robotiq_3f_gripper/set_speed")
        rospy.wait_for_service("/robotiq_3f_gripper/get_speed")
        rospy.wait_for_service("/robotiq_3f_gripper/set_torque")
        rospy.wait_for_service("/robotiq_3f_gripper/get_torque")
        # create service proxy
        self._activate_gripper = rospy.ServiceProxy("/robotiq_3f_gripper/activate", Activate)
        self._reset = rospy.ServiceProxy("/robotiq_3f_gripper/reset",Reset)
        self._close_gripper = rospy.ServiceProxy("/robotiq_3f_gripper/close_hand", Move)
        self._open_gripper = rospy.ServiceProxy("/robotiq_3f_gripper/open_hand", Move)
        self._set_mode = rospy.ServiceProxy("/robotiq_3f_gripper/set_mode", SetMode)
        self._get_mode = rospy.ServiceProxy("/robotiq_3f_gripper/get_mode", GetMode)
        self._set_position = rospy.ServiceProxy("/robotiq_3f_gripper/set_position", SetPosition)
        self._get_position = rospy.ServiceProxy("/robotiq_3f_gripper/get_position", GetPosition)
        self._set_speed = rospy.ServiceProxy("/robotiq_3f_gripper/set_speed", SetSpeed)
        self._get_speed = rospy.ServiceProxy("/robotiq_3f_gripper/get_speed", GetSpeed)
        self._set_torque = rospy.ServiceProxy("/robotiq_3f_gripper/set_torque", SetTorque)
        self._get_torque = rospy.ServiceProxy("/robotiq_3f_gripper/get_torque", GetTorque)
        print("Gripper services ok, remember to activate_gripper() before using it")

    # functions available

    def activate(self):
        result = self._activate_gripper()
        return result.success

    def reset(self):
        return self._reset().success

    def close(self):
        result = self._close_gripper()
        return result.success

    def open(self):
        result = self._open_gripper()
        return result.success


    def set_mode(self, mode):
        modes=["basic","pinch","wide","scissor"]
        #in scissor mode, the open and close commands will close the two fingers together horizontally
        if mode in modes:
            result = self._set_mode(mode)
            return result.success
        else:
            print("Error modes available: ",modes)
            return False

    def get_mode(self):
        return self._get_mode().mode

    def get_mode_success(self):
        return self._get_mode().success


    def set_position(self, position):
        if position < 0:
            position=0
        if position > 255:
            position=255
        return self._set_position(position).success

    def get_position(self):
        result = self._get_position()
        return result.target_position

    def get_position_fingers(self):
        result = self._get_position()
        return [result.finger_a_position, result.finger_b_position, result.finger_c_position]

    def get_position_success(self):
        return self._get_position().success
    

    def set_speed(self, speed):
        return self._set_speed(speed).success

    def get_speed(self):
        return self._get_speed().speed

    def get_speed_success(self):
        return self._get_speed().success
    

    def set_torque(self, torque):
        return self._set_torque(torque).success

    def get_torque(self):
        return self._get_torque().torque

    def get_torque_success(self):
        return self._get_torque().success
