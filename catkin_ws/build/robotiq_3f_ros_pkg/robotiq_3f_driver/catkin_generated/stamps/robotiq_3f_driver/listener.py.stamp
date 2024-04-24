#!/usr/bin python


import rospy

from robotiq_3f_gripper_articulated_msgs.msg import _Robotiq3FGripper_robot_input as inputMsg
from robotiq_3f_gripper_articulated_msgs.msg import _Robotiq3FGripper_robot_output as outputMsg

from time import sleep

#################################################
# NOTE:This program assumes simple control mode #
#################################################

class Robotic3fGripperDriver(object):
    def __init__(self):
        self._command_pub = rospy.Publisher('Robotiq3FGripperRobotOutput', outputMsg.Robotiq3FGripper_robot_output, queue_size=1)
        rospy.Subscriber("Robotiq3FGripperRobotInput", inputMsg.Robotiq3FGripper_robot_input, self._gripper_status_callback, queue_size=1)
        self._gripper_status = inputMsg.Robotiq3FGripper_robot_input()
        self._command = outputMsg.Robotiq3FGripper_robot_output()
        self._timeout = 30

    def _gripper_status_callback(self, msg):
        self._gripper_status = msg

    def _is_activated(self):
        if self._gripper_status.gACT == 0:
            return False
        elif self._gripper_status.gIMC == 0:
            return False
        else:
            return True

    def reset(self):
        self._command = outputMsg.Robotiq3FGripper_robot_output()
        self._command.rACT = 0
        self._command_pub.publish(self._command)

    def activate(self):
        self._command = outputMsg.Robotiq3FGripper_robot_output()
        self._command.rACT = 1
        self._command.rGTO = 1
        self._command.rSPA = 255
        self._command.rFRA = 150
        self._command_pub.publish(self._command)

    def open_hand(self):
        self._command.rPRA = 0
        self._command_pub.publish(self._command)

    def close_hand(self):
        self._command.rPRA = 255
        self._command_pub.publish(self._command)

    def set_mode(self, mode):
        if mode == 'basic':
            self._command.rMOD = 0
        elif mode == 'pinch':
            self._command.rMOD = 1
        elif mode == 'wide':
            self._command.rMOD = 2
        elif mode == 'scissor':
            self._command.rMOD = 3
        else:
            return
        self._command_pub.publish(self._command)

    def set_position(self, position):
        self._command.rPRA = int(position)
        if self._command.rPRA > 255:
            self._command.rPRA = 255
        elif self._command.rPRA < 0:
            self._command.rPRA = 0
        self._command_pub.publish(self._command)

    def set_speed(self, speed):
        self._command.rSPA = int(speed)
        if self._command.rSPA > 255:
            self._command.rSPA = 255
        elif self._command.rSPA < 0:
            self._command.rSPA = 0
        self._command_pub.publish(self._command)

    def set_torque(self, torque):
        self._command.rFRA = int(torque)
        if self._command.rFRA > 255:
            self._command.rFRA = 255
        elif self._command.rFRA < 0:
            self._command.rFRA = 0
        self._command_pub.publish(self._command)

    def get_mode(self):
        mode = self._gripper_status.gMOD
        if mode == 0:
            return 'basic'
        elif mode == 1:
            return 'pinch'
        elif mode == 2:
            return 'wide'
        elif mode == 3:
            return 'scissor'

    def get_position_target(self):
        # status: go to position request
        if self._gripper_status.gGTO == 1:
            count = 0
            while count < self._timeout:
                # status: gripper is stopped
                if self._gripper_status.gSTA != 0:
                    return self._gripper_status.gPRA
                sleep(0.1)

    def get_position_a(self):
        # status: go to position request
        if self._gripper_status.gGTO == 1:
            count = 0
            while count < self._timeout:
                # status: gripper is stopped
                if self._gripper_status.gSTA != 0:
                    return self._gripper_status.gPOA
                sleep(0.1)

    def get_position_b(self):
        # status: go to position request
        if self._gripper_status.gGTO == 1:
            count = 0
            while count < self._timeout:
                # status: gripper is stopped
                if self._gripper_status.gSTA != 0:
                    return self._gripper_status.gPOB
                sleep(0.1)

    def get_position_c(self):
        # status: go to position request
        if self._gripper_status.gGTO == 1:
            count = 0
            while count < self._timeout:
                # status: gripper is stopped
                if self._gripper_status.gSTA != 0:
                    return self._gripper_status.gPOC
                sleep(0.1)

    def get_speed(self):
        return self._command.rSPA

    def get_torque(self):
        return self._command.rFRA



import rospy

from robotiq_3f_srvs.srv import Activate, ActivateResponse
from robotiq_3f_srvs.srv import Reset, ResetResponse
from robotiq_3f_srvs.srv import Move, MoveResponse
from robotiq_3f_srvs.srv import SetMode, SetModeResponse
from robotiq_3f_srvs.srv import SetPosition, SetPositionResponse
from robotiq_3f_srvs.srv import SetSpeed, SetSpeedResponse
from robotiq_3f_srvs.srv import SetTorque, SetTorqueResponse
from robotiq_3f_srvs.srv import GetMode, GetModeResponse
from robotiq_3f_srvs.srv import GetPosition, GetPositionResponse
from robotiq_3f_srvs.srv import GetSpeed, GetSpeedResponse
from robotiq_3f_srvs.srv import GetTorque, GetTorqueResponse

#from driver import Robotic3fGripperDriver
#import driver

from time import sleep

class Robotic3fGripperListener(object):
    def __init__(self):
        self.gripper = Robotic3fGripperDriver()
        self._activate_service = rospy.Service('/robotiq_3f_gripper/activate', Activate, self.activate)
        self._reset_service = rospy.Service('/robotiq_3f_gripper/reset', Reset, self.reset)
        self._open_hand_service = rospy.Service('/robotiq_3f_gripper/open_hand', Move, self.open_hand)
        self._close_hand_service = rospy.Service('/robotiq_3f_gripper/close_hand', Move, self.close_hand)
        self._set_mode_service = rospy.Service('/robotiq_3f_gripper/set_mode', SetMode, self.set_mode)
        self._set_position_service = rospy.Service('/robotiq_3f_gripper/set_position', SetPosition, self.set_position)
        self._set_speed_service = rospy.Service('/robotiq_3f_gripper/set_speed', SetSpeed, self.set_speed)
        self._set_torque_service = rospy.Service('/robotiq_3f_gripper/set_torque', SetTorque, self.set_torque)
        self._get_mode_service = rospy.Service('/robotiq_3f_gripper/get_mode', GetMode, self.get_mode)
        self._get_position_service = rospy.Service('/robotiq_3f_gripper/get_position', GetPosition, self.get_position)
        self._get_speed_service = rospy.Service('/robotiq_3f_gripper/get_speed', GetSpeed, self.get_speed)
        self._get_torque_service = rospy.Service('/robotiq_3f_gripper/get_torque', GetTorque, self.get_torque)
        rospy.loginfo("Ready to Robotic 3f Gripper services")

    def activate(self, req):
        ret = ActivateResponse()
        self.gripper.activate()
        sleep(1)
        while self.gripper._gripper_status.gIMC != 3:
            pass
        ret.success = True
        return ret

    def reset(self, req):
        ret = ResetResponse()
        self.gripper.reset()
        ret.success = True
        return ret

    def open_hand(self, req):
        ret = MoveResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        self.gripper.open_hand()
        sleep(1)
        while True:
            if self.gripper._gripper_status.gGTO == 1 and \
               self.gripper._gripper_status.gSTA != 0:
                break
        ret.success = True
        return ret

    def close_hand(self, req):
        ret = MoveResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        self.gripper.close_hand()
        sleep(1)
        while True:
            if self.gripper._gripper_status.gGTO == 1 and \
               self.gripper._gripper_status.gSTA != 0:
                break
        ret.success = True
        return ret

    def set_mode(self, req):
        ret = SetModeResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        self.gripper.set_mode(req.mode)
        sleep(1)
        while self.gripper._gripper_status.gIMC != 3:
            pass
        ret.success = True
        return ret

    def set_position(self, req):
        ret = SetPositionResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        self.gripper.set_position(req.position)
        sleep(1)
        while True:
            if self.gripper._gripper_status.gGTO == 1 and \
               self.gripper._gripper_status.gSTA != 0:
                break
        ret.success = True
        return ret

    def set_speed(self, req):
        ret = SetSpeedResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        self.gripper.set_speed(req.speed)
        ret.success = True
        return ret

    def set_torque(self, req):
        ret = SetTorqueResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        self.gripper.set_torque(req.torque)
        ret.success = True
        return ret

    def get_mode(self, req):
        ret = GetModeResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        ret.mode = self.gripper.get_mode()
        if ret.mode:
            ret.success = True
        else:
            ret.success = False
        return ret

    def get_position(self, req):
        ret = GetPositionResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        ret.target_position = self.gripper.get_position_target()
        ret.finger_a_position = self.gripper.get_position_a()
        ret.finger_b_position = self.gripper.get_position_b()
        ret.finger_c_position = self.gripper.get_position_c()
        if (ret.target_position is not None) and (ret.finger_a_position is not None) and \
           (ret.finger_b_position is not None) and (ret.finger_c_position is not None):
            ret.success = True
        else:
            ret.success = False
        return ret

    def get_speed(self, req):
        ret = GetSpeedResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        ret.speed = self.gripper.get_speed()
        ret.success = True
        return ret

    def get_torque(self, req):
        ret = GetTorqueResponse()
        if not self.gripper._is_activated():
            ret.success = False
            return ret
        ret.torque = self.gripper.get_torque()
        ret.success = True
        return ret

if __name__ == '__main__':
    rospy.init_node('robotiq_3f_gripper_listener')
    robotiq_3f_gripper_listener = Robotic3fGripperListener()
    rospy.spin()
