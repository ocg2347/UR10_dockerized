; Auto-generated. Do not edit!


(cl:in-package robotiq_3f_srvs-srv)


;//! \htmlinclude GetTorque-request.msg.html

(cl:defclass <GetTorque-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetTorque-request (<GetTorque-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTorque-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTorque-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<GetTorque-request> is deprecated: use robotiq_3f_srvs-srv:GetTorque-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTorque-request>) ostream)
  "Serializes a message object of type '<GetTorque-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTorque-request>) istream)
  "Deserializes a message object of type '<GetTorque-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTorque-request>)))
  "Returns string type for a service object of type '<GetTorque-request>"
  "robotiq_3f_srvs/GetTorqueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTorque-request)))
  "Returns string type for a service object of type 'GetTorque-request"
  "robotiq_3f_srvs/GetTorqueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTorque-request>)))
  "Returns md5sum for a message object of type '<GetTorque-request>"
  "84acdc269d50ea8a59a1ba851600ccec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTorque-request)))
  "Returns md5sum for a message object of type 'GetTorque-request"
  "84acdc269d50ea8a59a1ba851600ccec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTorque-request>)))
  "Returns full string definition for message of type '<GetTorque-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTorque-request)))
  "Returns full string definition for message of type 'GetTorque-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTorque-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTorque-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTorque-request
))
;//! \htmlinclude GetTorque-response.msg.html

(cl:defclass <GetTorque-response> (roslisp-msg-protocol:ros-message)
  ((torque
    :reader torque
    :initarg :torque
    :type cl:fixnum
    :initform 0)
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GetTorque-response (<GetTorque-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTorque-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTorque-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<GetTorque-response> is deprecated: use robotiq_3f_srvs-srv:GetTorque-response instead.")))

(cl:ensure-generic-function 'torque-val :lambda-list '(m))
(cl:defmethod torque-val ((m <GetTorque-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:torque-val is deprecated.  Use robotiq_3f_srvs-srv:torque instead.")
  (torque m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetTorque-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:success-val is deprecated.  Use robotiq_3f_srvs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTorque-response>) ostream)
  "Serializes a message object of type '<GetTorque-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'torque)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTorque-response>) istream)
  "Deserializes a message object of type '<GetTorque-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'torque)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTorque-response>)))
  "Returns string type for a service object of type '<GetTorque-response>"
  "robotiq_3f_srvs/GetTorqueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTorque-response)))
  "Returns string type for a service object of type 'GetTorque-response"
  "robotiq_3f_srvs/GetTorqueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTorque-response>)))
  "Returns md5sum for a message object of type '<GetTorque-response>"
  "84acdc269d50ea8a59a1ba851600ccec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTorque-response)))
  "Returns md5sum for a message object of type 'GetTorque-response"
  "84acdc269d50ea8a59a1ba851600ccec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTorque-response>)))
  "Returns full string definition for message of type '<GetTorque-response>"
  (cl:format cl:nil "uint8 torque~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTorque-response)))
  "Returns full string definition for message of type 'GetTorque-response"
  (cl:format cl:nil "uint8 torque~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTorque-response>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTorque-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTorque-response
    (cl:cons ':torque (torque msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetTorque)))
  'GetTorque-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetTorque)))
  'GetTorque-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTorque)))
  "Returns string type for a service object of type '<GetTorque>"
  "robotiq_3f_srvs/GetTorque")