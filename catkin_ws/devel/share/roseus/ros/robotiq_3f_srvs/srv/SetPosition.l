;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::SetPosition)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'SetPosition (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::SETPOSITION")
  (make-package "ROBOTIQ_3F_SRVS::SETPOSITION"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETPOSITIONREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::SETPOSITIONREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETPOSITIONRESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::SETPOSITIONRESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::SetPositionRequest
  :super ros::object
  :slots (_position ))

(defmethod robotiq_3f_srvs::SetPositionRequest
  (:init
   (&key
    ((:position __position) 0)
    )
   (send-super :init)
   (setq _position (round __position))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; uint8 _position
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _position
       (write-byte _position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _position
     (setq _position (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::SetPositionResponse
  :super ros::object
  :slots (_success ))

(defmethod robotiq_3f_srvs::SetPositionResponse
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

(defclass robotiq_3f_srvs::SetPosition
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::SetPosition :md5sum-) "1963b788318b4ab920816d8b79cff835")
(setf (get robotiq_3f_srvs::SetPosition :datatype-) "robotiq_3f_srvs/SetPosition")
(setf (get robotiq_3f_srvs::SetPosition :request) robotiq_3f_srvs::SetPositionRequest)
(setf (get robotiq_3f_srvs::SetPosition :response) robotiq_3f_srvs::SetPositionResponse)

(defmethod robotiq_3f_srvs::SetPositionRequest
  (:response () (instance robotiq_3f_srvs::SetPositionResponse :init)))

(setf (get robotiq_3f_srvs::SetPositionRequest :md5sum-) "1963b788318b4ab920816d8b79cff835")
(setf (get robotiq_3f_srvs::SetPositionRequest :datatype-) "robotiq_3f_srvs/SetPositionRequest")
(setf (get robotiq_3f_srvs::SetPositionRequest :definition-)
      "uint8 position
---
bool success

")

(setf (get robotiq_3f_srvs::SetPositionResponse :md5sum-) "1963b788318b4ab920816d8b79cff835")
(setf (get robotiq_3f_srvs::SetPositionResponse :datatype-) "robotiq_3f_srvs/SetPositionResponse")
(setf (get robotiq_3f_srvs::SetPositionResponse :definition-)
      "uint8 position
---
bool success

")



(provide :robotiq_3f_srvs/SetPosition "1963b788318b4ab920816d8b79cff835")


