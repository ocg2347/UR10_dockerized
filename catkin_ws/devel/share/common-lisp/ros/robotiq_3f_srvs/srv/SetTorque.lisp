; Auto-generated. Do not edit!


(cl:in-package robotiq_3f_srvs-srv)


;//! \htmlinclude SetTorque-request.msg.html

(cl:defclass <SetTorque-request> (roslisp-msg-protocol:ros-message)
  ((torque
    :reader torque
    :initarg :torque
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetTorque-request (<SetTorque-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTorque-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTorque-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<SetTorque-request> is deprecated: use robotiq_3f_srvs-srv:SetTorque-request instead.")))

(cl:ensure-generic-function 'torque-val :lambda-list '(m))
(cl:defmethod torque-val ((m <SetTorque-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:torque-val is deprecated.  Use robotiq_3f_srvs-srv:torque instead.")
  (torque m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTorque-request>) ostream)
  "Serializes a message object of type '<SetTorque-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'torque)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTorque-request>) istream)
  "Deserializes a message object of type '<SetTorque-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'torque)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTorque-request>)))
  "Returns string type for a service object of type '<SetTorque-request>"
  "robotiq_3f_srvs/SetTorqueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTorque-request)))
  "Returns string type for a service object of type 'SetTorque-request"
  "robotiq_3f_srvs/SetTorqueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTorque-request>)))
  "Returns md5sum for a message object of type '<SetTorque-request>"
  "8194d85bcb7da4631dfd6a561184076a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTorque-request)))
  "Returns md5sum for a message object of type 'SetTorque-request"
  "8194d85bcb7da4631dfd6a561184076a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTorque-request>)))
  "Returns full string definition for message of type '<SetTorque-request>"
  (cl:format cl:nil "uint8 torque~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTorque-request)))
  "Returns full string definition for message of type 'SetTorque-request"
  (cl:format cl:nil "uint8 torque~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTorque-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTorque-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTorque-request
    (cl:cons ':torque (torque msg))
))
;//! \htmlinclude SetTorque-response.msg.html

(cl:defclass <SetTorque-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetTorque-response (<SetTorque-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTorque-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTorque-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<SetTorque-response> is deprecated: use robotiq_3f_srvs-srv:SetTorque-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetTorque-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:success-val is deprecated.  Use robotiq_3f_srvs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTorque-response>) ostream)
  "Serializes a message object of type '<SetTorque-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTorque-response>) istream)
  "Deserializes a message object of type '<SetTorque-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTorque-response>)))
  "Returns string type for a service object of type '<SetTorque-response>"
  "robotiq_3f_srvs/SetTorqueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTorque-response)))
  "Returns string type for a service object of type 'SetTorque-response"
  "robotiq_3f_srvs/SetTorqueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTorque-response>)))
  "Returns md5sum for a message object of type '<SetTorque-response>"
  "8194d85bcb7da4631dfd6a561184076a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTorque-response)))
  "Returns md5sum for a message object of type 'SetTorque-response"
  "8194d85bcb7da4631dfd6a561184076a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTorque-response>)))
  "Returns full string definition for message of type '<SetTorque-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTorque-response)))
  "Returns full string definition for message of type 'SetTorque-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTorque-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTorque-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTorque-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetTorque)))
  'SetTorque-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetTorque)))
  'SetTorque-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTorque)))
  "Returns string type for a service object of type '<SetTorque>"
  "robotiq_3f_srvs/SetTorque")