;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::Reset)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'Reset (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::RESET")
  (make-package "ROBOTIQ_3F_SRVS::RESET"))
(unless (find-package "ROBOTIQ_3F_SRVS::RESETREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::RESETREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::RESETRESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::RESETRESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::ResetRequest
  :super ros::object
  :slots ())

(defmethod robotiq_3f_srvs::ResetRequest
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

(defclass robotiq_3f_srvs::ResetResponse
  :super ros::object
  :slots (_success ))

(defmethod robotiq_3f_srvs::ResetResponse
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

(defclass robotiq_3f_srvs::Reset
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::Reset :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::Reset :datatype-) "robotiq_3f_srvs/Reset")
(setf (get robotiq_3f_srvs::Reset :request) robotiq_3f_srvs::ResetRequest)
(setf (get robotiq_3f_srvs::Reset :response) robotiq_3f_srvs::ResetResponse)

(defmethod robotiq_3f_srvs::ResetRequest
  (:response () (instance robotiq_3f_srvs::ResetResponse :init)))

(setf (get robotiq_3f_srvs::ResetRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::ResetRequest :datatype-) "robotiq_3f_srvs/ResetRequest")
(setf (get robotiq_3f_srvs::ResetRequest :definition-)
      "---
bool success

")

(setf (get robotiq_3f_srvs::ResetResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::ResetResponse :datatype-) "robotiq_3f_srvs/ResetResponse")
(setf (get robotiq_3f_srvs::ResetResponse :definition-)
      "---
bool success

")



(provide :robotiq_3f_srvs/Reset "358e233cde0c8a8bcfea4ce193f8fc15")


