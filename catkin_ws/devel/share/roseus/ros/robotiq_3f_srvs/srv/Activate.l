;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::Activate)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'Activate (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::ACTIVATE")
  (make-package "ROBOTIQ_3F_SRVS::ACTIVATE"))
(unless (find-package "ROBOTIQ_3F_SRVS::ACTIVATEREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::ACTIVATEREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::ACTIVATERESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::ACTIVATERESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::ActivateRequest
  :super ros::object
  :slots ())

(defmethod robotiq_3f_srvs::ActivateRequest
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

(defclass robotiq_3f_srvs::ActivateResponse
  :super ros::object
  :slots (_success ))

(defmethod robotiq_3f_srvs::ActivateResponse
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

(defclass robotiq_3f_srvs::Activate
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::Activate :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::Activate :datatype-) "robotiq_3f_srvs/Activate")
(setf (get robotiq_3f_srvs::Activate :request) robotiq_3f_srvs::ActivateRequest)
(setf (get robotiq_3f_srvs::Activate :response) robotiq_3f_srvs::ActivateResponse)

(defmethod robotiq_3f_srvs::ActivateRequest
  (:response () (instance robotiq_3f_srvs::ActivateResponse :init)))

(setf (get robotiq_3f_srvs::ActivateRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::ActivateRequest :datatype-) "robotiq_3f_srvs/ActivateRequest")
(setf (get robotiq_3f_srvs::ActivateRequest :definition-)
      "---
bool success

")

(setf (get robotiq_3f_srvs::ActivateResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get robotiq_3f_srvs::ActivateResponse :datatype-) "robotiq_3f_srvs/ActivateResponse")
(setf (get robotiq_3f_srvs::ActivateResponse :definition-)
      "---
bool success

")



(provide :robotiq_3f_srvs/Activate "358e233cde0c8a8bcfea4ce193f8fc15")


