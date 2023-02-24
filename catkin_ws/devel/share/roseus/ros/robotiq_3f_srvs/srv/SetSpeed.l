;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::SetSpeed)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'SetSpeed (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::SETSPEED")
  (make-package "ROBOTIQ_3F_SRVS::SETSPEED"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETSPEEDREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::SETSPEEDREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETSPEEDRESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::SETSPEEDRESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::SetSpeedRequest
  :super ros::object
  :slots (_speed ))

(defmethod robotiq_3f_srvs::SetSpeedRequest
  (:init
   (&key
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; uint8 _speed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _speed
       (write-byte _speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _speed
     (setq _speed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::SetSpeedResponse
  :super ros::object
  :slots (_success ))

(defmethod robotiq_3f_srvs::SetSpeedResponse
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

(defclass robotiq_3f_srvs::SetSpeed
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::SetSpeed :md5sum-) "0ac8fdc96972cecc8d4bedcd2935d6ea")
(setf (get robotiq_3f_srvs::SetSpeed :datatype-) "robotiq_3f_srvs/SetSpeed")
(setf (get robotiq_3f_srvs::SetSpeed :request) robotiq_3f_srvs::SetSpeedRequest)
(setf (get robotiq_3f_srvs::SetSpeed :response) robotiq_3f_srvs::SetSpeedResponse)

(defmethod robotiq_3f_srvs::SetSpeedRequest
  (:response () (instance robotiq_3f_srvs::SetSpeedResponse :init)))

(setf (get robotiq_3f_srvs::SetSpeedRequest :md5sum-) "0ac8fdc96972cecc8d4bedcd2935d6ea")
(setf (get robotiq_3f_srvs::SetSpeedRequest :datatype-) "robotiq_3f_srvs/SetSpeedRequest")
(setf (get robotiq_3f_srvs::SetSpeedRequest :definition-)
      "uint8 speed
---
bool success

")

(setf (get robotiq_3f_srvs::SetSpeedResponse :md5sum-) "0ac8fdc96972cecc8d4bedcd2935d6ea")
(setf (get robotiq_3f_srvs::SetSpeedResponse :datatype-) "robotiq_3f_srvs/SetSpeedResponse")
(setf (get robotiq_3f_srvs::SetSpeedResponse :definition-)
      "uint8 speed
---
bool success

")



(provide :robotiq_3f_srvs/SetSpeed "0ac8fdc96972cecc8d4bedcd2935d6ea")


