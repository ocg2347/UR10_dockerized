;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::SetMode)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'SetMode (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::SETMODE")
  (make-package "ROBOTIQ_3F_SRVS::SETMODE"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETMODEREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::SETMODEREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::SETMODERESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::SETMODERESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::SetModeRequest
  :super ros::object
  :slots (_mode ))

(defmethod robotiq_3f_srvs::SetModeRequest
  (:init
   (&key
    ((:mode __mode) "")
    )
   (send-super :init)
   (setq _mode (string __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; string _mode
    4 (length _mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robotiq_3f_srvs::SetModeResponse
  :super ros::object
  :slots (_success ))

(defmethod robotiq_3f_srvs::SetModeResponse
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

(defclass robotiq_3f_srvs::SetMode
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::SetMode :md5sum-) "939409827c5731ec5346c99677bd2a1d")
(setf (get robotiq_3f_srvs::SetMode :datatype-) "robotiq_3f_srvs/SetMode")
(setf (get robotiq_3f_srvs::SetMode :request) robotiq_3f_srvs::SetModeRequest)
(setf (get robotiq_3f_srvs::SetMode :response) robotiq_3f_srvs::SetModeResponse)

(defmethod robotiq_3f_srvs::SetModeRequest
  (:response () (instance robotiq_3f_srvs::SetModeResponse :init)))

(setf (get robotiq_3f_srvs::SetModeRequest :md5sum-) "939409827c5731ec5346c99677bd2a1d")
(setf (get robotiq_3f_srvs::SetModeRequest :datatype-) "robotiq_3f_srvs/SetModeRequest")
(setf (get robotiq_3f_srvs::SetModeRequest :definition-)
      "string mode
---
bool success

")

(setf (get robotiq_3f_srvs::SetModeResponse :md5sum-) "939409827c5731ec5346c99677bd2a1d")
(setf (get robotiq_3f_srvs::SetModeResponse :datatype-) "robotiq_3f_srvs/SetModeResponse")
(setf (get robotiq_3f_srvs::SetModeResponse :definition-)
      "string mode
---
bool success

")



(provide :robotiq_3f_srvs/SetMode "939409827c5731ec5346c99677bd2a1d")


