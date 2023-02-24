;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::GetMode)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'GetMode (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::GETMODE")
  (make-package "ROBOTIQ_3F_SRVS::GETMODE"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETMODEREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::GETMODEREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETMODERESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::GETMODERESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::GetModeRequest
  :super ros::object
  :slots ())

(defmethod robotiq_3f_srvs::GetModeRequest
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

(defclass robotiq_3f_srvs::GetModeResponse
  :super ros::object
  :slots (_mode _success ))

(defmethod robotiq_3f_srvs::GetModeResponse
  (:init
   (&key
    ((:mode __mode) "")
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _mode (string __mode))
   (setq _success __success)
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; string _mode
    4 (length _mode)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::GetMode
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::GetMode :md5sum-) "0c8272edd1805ed053997f57be90c52f")
(setf (get robotiq_3f_srvs::GetMode :datatype-) "robotiq_3f_srvs/GetMode")
(setf (get robotiq_3f_srvs::GetMode :request) robotiq_3f_srvs::GetModeRequest)
(setf (get robotiq_3f_srvs::GetMode :response) robotiq_3f_srvs::GetModeResponse)

(defmethod robotiq_3f_srvs::GetModeRequest
  (:response () (instance robotiq_3f_srvs::GetModeResponse :init)))

(setf (get robotiq_3f_srvs::GetModeRequest :md5sum-) "0c8272edd1805ed053997f57be90c52f")
(setf (get robotiq_3f_srvs::GetModeRequest :datatype-) "robotiq_3f_srvs/GetModeRequest")
(setf (get robotiq_3f_srvs::GetModeRequest :definition-)
      "---
string mode
bool success

")

(setf (get robotiq_3f_srvs::GetModeResponse :md5sum-) "0c8272edd1805ed053997f57be90c52f")
(setf (get robotiq_3f_srvs::GetModeResponse :datatype-) "robotiq_3f_srvs/GetModeResponse")
(setf (get robotiq_3f_srvs::GetModeResponse :definition-)
      "---
string mode
bool success

")



(provide :robotiq_3f_srvs/GetMode "0c8272edd1805ed053997f57be90c52f")


