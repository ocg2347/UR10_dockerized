;; Auto-generated. Do not edit!


(when (boundp 'robotiq_3f_srvs::GetPosition)
  (if (not (find-package "ROBOTIQ_3F_SRVS"))
    (make-package "ROBOTIQ_3F_SRVS"))
  (shadow 'GetPosition (find-package "ROBOTIQ_3F_SRVS")))
(unless (find-package "ROBOTIQ_3F_SRVS::GETPOSITION")
  (make-package "ROBOTIQ_3F_SRVS::GETPOSITION"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETPOSITIONREQUEST")
  (make-package "ROBOTIQ_3F_SRVS::GETPOSITIONREQUEST"))
(unless (find-package "ROBOTIQ_3F_SRVS::GETPOSITIONRESPONSE")
  (make-package "ROBOTIQ_3F_SRVS::GETPOSITIONRESPONSE"))

(in-package "ROS")





(defclass robotiq_3f_srvs::GetPositionRequest
  :super ros::object
  :slots ())

(defmethod robotiq_3f_srvs::GetPositionRequest
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

(defclass robotiq_3f_srvs::GetPositionResponse
  :super ros::object
  :slots (_target_position _finger_a_position _finger_b_position _finger_c_position _success ))

(defmethod robotiq_3f_srvs::GetPositionResponse
  (:init
   (&key
    ((:target_position __target_position) 0)
    ((:finger_a_position __finger_a_position) 0)
    ((:finger_b_position __finger_b_position) 0)
    ((:finger_c_position __finger_c_position) 0)
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _target_position (round __target_position))
   (setq _finger_a_position (round __finger_a_position))
   (setq _finger_b_position (round __finger_b_position))
   (setq _finger_c_position (round __finger_c_position))
   (setq _success __success)
   self)
  (:target_position
   (&optional __target_position)
   (if __target_position (setq _target_position __target_position)) _target_position)
  (:finger_a_position
   (&optional __finger_a_position)
   (if __finger_a_position (setq _finger_a_position __finger_a_position)) _finger_a_position)
  (:finger_b_position
   (&optional __finger_b_position)
   (if __finger_b_position (setq _finger_b_position __finger_b_position)) _finger_b_position)
  (:finger_c_position
   (&optional __finger_c_position)
   (if __finger_c_position (setq _finger_c_position __finger_c_position)) _finger_c_position)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; uint8 _target_position
    1
    ;; uint8 _finger_a_position
    1
    ;; uint8 _finger_b_position
    1
    ;; uint8 _finger_c_position
    1
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _target_position
       (write-byte _target_position s)
     ;; uint8 _finger_a_position
       (write-byte _finger_a_position s)
     ;; uint8 _finger_b_position
       (write-byte _finger_b_position s)
     ;; uint8 _finger_c_position
       (write-byte _finger_c_position s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _target_position
     (setq _target_position (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _finger_a_position
     (setq _finger_a_position (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _finger_b_position
     (setq _finger_b_position (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _finger_c_position
     (setq _finger_c_position (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robotiq_3f_srvs::GetPosition
  :super ros::object
  :slots ())

(setf (get robotiq_3f_srvs::GetPosition :md5sum-) "15af47e08a021b42de872282bf4961e5")
(setf (get robotiq_3f_srvs::GetPosition :datatype-) "robotiq_3f_srvs/GetPosition")
(setf (get robotiq_3f_srvs::GetPosition :request) robotiq_3f_srvs::GetPositionRequest)
(setf (get robotiq_3f_srvs::GetPosition :response) robotiq_3f_srvs::GetPositionResponse)

(defmethod robotiq_3f_srvs::GetPositionRequest
  (:response () (instance robotiq_3f_srvs::GetPositionResponse :init)))

(setf (get robotiq_3f_srvs::GetPositionRequest :md5sum-) "15af47e08a021b42de872282bf4961e5")
(setf (get robotiq_3f_srvs::GetPositionRequest :datatype-) "robotiq_3f_srvs/GetPositionRequest")
(setf (get robotiq_3f_srvs::GetPositionRequest :definition-)
      "---
uint8 target_position
uint8 finger_a_position
uint8 finger_b_position
uint8 finger_c_position
bool success

")

(setf (get robotiq_3f_srvs::GetPositionResponse :md5sum-) "15af47e08a021b42de872282bf4961e5")
(setf (get robotiq_3f_srvs::GetPositionResponse :datatype-) "robotiq_3f_srvs/GetPositionResponse")
(setf (get robotiq_3f_srvs::GetPositionResponse :definition-)
      "---
uint8 target_position
uint8 finger_a_position
uint8 finger_b_position
uint8 finger_c_position
bool success

")



(provide :robotiq_3f_srvs/GetPosition "15af47e08a021b42de872282bf4961e5")


