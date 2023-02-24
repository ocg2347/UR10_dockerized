;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::Move)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'Move (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::MOVE")
  (make-package "ROBOTIQ_3F_SRVS::MOVE"))
(unless (find-package "ROBOTIQ_3F_SRVS::MOVEREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::MOVEREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::MOVERESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::MOVERESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::MoveRequest
  :super ros::object
  :slots ())

(defmethod robotiq_3f_srvs::MoveRequest
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

(defclass robotiq_3f_srvs::MoveResponse
  :super ros::object
  :slots (_success ))

(defmethod robotiq_3f_srvs::MoveResponse
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

(defclass robotiq_3f_srvs::Move
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::Move :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::Move :datatype-) "robotiq_3f_srvs/Move")
(setf (get robotiq_3f_srvs::Move :request) robotiq_3f_srvs::MoveRequest)
(setf (get robotiq_3f_srvs::Move :response) robotiq_3f_srvs::MoveResponse)

(defmethod robotiq_3f_srvs::MoveRequest
  (:response () (instance robotiq_3f_srvs::MoveResponse :init)))

(setf (get robotiq_3f_srvs::MoveRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::MoveRequest :datatype-) "robotiq_3f_srvs/MoveRequest")
(setf (get robotiq_3f_srvs::MoveRequest :definition-)
      "---
bool success

")

(setf (get robotiq_3f_srvs::MoveResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::MoveResponse :datatype-) "robotiq_3f_srvs/MoveResponse")
(setf (get robotiq_3f_srvs::MoveResponse :definition-)
      "---
bool success

")



(provide :robotiq_3f_srvs/Move "358e233cde0c8a8bcfea4ce193f8fc15")


