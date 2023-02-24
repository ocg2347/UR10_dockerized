;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::GetSpeed)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'GetSpeed (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::GETSPEED")
  (make-package "ROBOTIQ_3F_SRVS::GETSPEED"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETSPEEDREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::GETSPEEDREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETSPEEDRESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::GETSPEEDRESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::GetSpeedRequest
  :super ros::object
  :slots ())

(defmethod robotiq_3f_srvs::GetSpeedRequest
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

(defclass robotiq_3f_srvs::GetSpeedResponse
  :super ros::object
  :slots (_speed _success ))

(defmethod robotiq_3f_srvs::GetSpeedResponse
  (:init
   (&key
    ((:speed __speed) 0)
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _speed (round __speed))
   (setq _success __success)
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; uint8 _speed
    1
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _speed
       (write-byte _speed s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _speed
     (setq _speed (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::GetSpeed
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::GetSpeed :md5sum-) "6f5ae4e6edb4b56e87a35277f1b9993b")
(setf (get robotiq_3f_srvs::GetSpeed :datatype-) "robotiq_3f_srvs/GetSpeed")
(setf (get robotiq_3f_srvs::GetSpeed :request) robotiq_3f_srvs::GetSpeedRequest)
(setf (get robotiq_3f_srvs::GetSpeed :response) robotiq_3f_srvs::GetSpeedResponse)

(defmethod robotiq_3f_srvs::GetSpeedRequest
  (:response () (instance robotiq_3f_srvs::GetSpeedResponse :init)))

(setf (get robotiq_3f_srvs::GetSpeedRequest :md5sum-) "6f5ae4e6edb4b56e87a35277f1b9993b")
(setf (get robotiq_3f_srvs::GetSpeedRequest :datatype-) "robotiq_3f_srvs/GetSpeedRequest")
(setf (get robotiq_3f_srvs::GetSpeedRequest :definition-)
      "---
uint8 speed
bool success

")

(setf (get robotiq_3f_srvs::GetSpeedResponse :md5sum-) "6f5ae4e6edb4b56e87a35277f1b9993b")
(setf (get robotiq_3f_srvs::GetSpeedResponse :datatype-) "robotiq_3f_srvs/GetSpeedResponse")
(setf (get robotiq_3f_srvs::GetSpeedResponse :definition-)
      "---
uint8 speed
bool success

")



(provide :robotiq_3f_srvs/GetSpeed "6f5ae4e6edb4b56e87a35277f1b9993b")


