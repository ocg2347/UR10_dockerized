;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::SetTorque)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'SetTorque (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::SETTORQUE")
  (make-package "ROBOTIQ_3F_SRVS::SETTORQUE"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETTORQUEREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::SETTORQUEREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETTORQUERESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::SETTORQUERESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::SetTorqueRequest
  :super ros::object
  :slots (_torque ))

(defmethod robotiq_3f_srvs::SetTorqueRequest
  (:init
   (&key
    ((:torque __torque) 0)
    )
   (send-super :init)
   (setq _torque (round __torque))
   self)
  (:torque
   (&optional __torque)
   (if __torque (setq _torque __torque)) _torque)
  (:serialization-length
   ()
   (+
    ;; uint8 _torque
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _torque
       (write-byte _torque s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _torque
     (setq _torque (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::SetTorqueResponse
  :super ros::object
  :slots (_success ))

(defmethod robotiq_3f_srvs::SetTorqueResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::SetTorque
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::SetTorque :md5sum-) "8194d85bcb7da4631dfd6a561184076a")
(setf (get robotiq_3f_srvs::SetTorque :datatype-) "robotiq_3f_srvs/SetTorque")
(setf (get robotiq_3f_srvs::SetTorque :request) robotiq_3f_srvs::SetTorqueRequest)
(setf (get robotiq_3f_srvs::SetTorque :response) robotiq_3f_srvs::SetTorqueResponse)

(defmethod robotiq_3f_srvs::SetTorqueRequest
  (:response () (instance robotiq_3f_srvs::SetTorqueResponse :init)))

(setf (get robotiq_3f_srvs::SetTorqueRequest :md5sum-) "8194d85bcb7da4631dfd6a561184076a")
(setf (get robotiq_3f_srvs::SetTorqueRequest :datatype-) "robotiq_3f_srvs/SetTorqueRequest")
(setf (get robotiq_3f_srvs::SetTorqueRequest :definition-)
      "uint8 torque
---
bool success

")

(setf (get robotiq_3f_srvs::SetTorqueResponse :md5sum-) "8194d85bcb7da4631dfd6a561184076a")
(setf (get robotiq_3f_srvs::SetTorqueResponse :datatype-) "robotiq_3f_srvs/SetTorqueResponse")
(setf (get robotiq_3f_srvs::SetTorqueResponse :definition-)
      "uint8 torque
---
bool success

")



(provide :robotiq_3f_srvs/SetTorque "8194d85bcb7da4631dfd6a561184076a")


