;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::GetTorque)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'GetTorque (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::GETTORQUE")
  (make-package "ROBOTIQ_3F_SRVS::GETTORQUE"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETTORQUEREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::GETTORQUEREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETTORQUERESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::GETTORQUERESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::GetTorqueRequest
  :super ros::object
  :slots ())

(defmethod robotiq_3f_srvs::GetTorqueRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass robotiq_3f_srvs::GetTorqueResponse
  :super ros::object
  :slots (_torque _success ))

(defmethod robotiq_3f_srvs::GetTorqueResponse
  (:init
   (&key
    ((:torque __torque) 0)
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _torque (round __torque))
   (setq _success __success)
   self)
  (:torque
   (&optional __torque)
   (if __torque (setq _torque __torque)) _torque)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; uint8 _torque
    1
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _torque
       (write-byte _torque s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _torque
     (setq _torque (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::GetTorque
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::GetTorque :md5sum-) "84acdc269d50ea8a59a1ba851600ccec")
(setf (get robotiq_3f_srvs::GetTorque :datatype-) "robotiq_3f_srvs/GetTorque")
(setf (get robotiq_3f_srvs::GetTorque :request) robotiq_3f_srvs::GetTorqueRequest)
(setf (get robotiq_3f_srvs::GetTorque :response) robotiq_3f_srvs::GetTorqueResponse)

(defmethod robotiq_3f_srvs::GetTorqueRequest
  (:response () (instance robotiq_3f_srvs::GetTorqueResponse :init)))

(setf (get robotiq_3f_srvs::GetTorqueRequest :md5sum-) "84acdc269d50ea8a59a1ba851600ccec")
(setf (get robotiq_3f_srvs::GetTorqueRequest :datatype-) "robotiq_3f_srvs/GetTorqueRequest")
(setf (get robotiq_3f_srvs::GetTorqueRequest :definition-)
      "---
uint8 torque
bool success

")

(setf (get robotiq_3f_srvs::GetTorqueResponse :md5sum-) "84acdc269d50ea8a59a1ba851600ccec")
(setf (get robotiq_3f_srvs::GetTorqueResponse :datatype-) "robotiq_3f_srvs/GetTorqueResponse")
(setf (get robotiq_3f_srvs::GetTorqueResponse :definition-)
      "---
uint8 torque
bool success

")



(provide :robotiq_3f_srvs/GetTorque "84acdc269d50ea8a59a1ba851600ccec")


