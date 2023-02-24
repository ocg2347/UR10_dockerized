; Auto-generated. Do not edit!


(cl:in-package robotiq_3f_srvs-srv)


;//! \htmlinclude SetPosition-request.msg.html

(cl:defclass <SetPosition-request> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetPosition-request (<SetPosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<SetPosition-request> is deprecated: use robotiq_3f_srvs-srv:SetPosition-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <SetPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:position-val is deprecated.  Use robotiq_3f_srvs-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPosition-request>) ostream)
  "Serializes a message object of type '<SetPosition-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPosition-request>) istream)
  "Deserializes a message object of type '<SetPosition-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'position)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPosition-request>)))
  "Returns string type for a service object of type '<SetPosition-request>"
  "robotiq_3f_srvs/SetPositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPosition-request)))
  "Returns string type for a service object of type 'SetPosition-request"
  "robotiq_3f_srvs/SetPositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPosition-request>)))
  "Returns md5sum for a message object of type '<SetPosition-request>"
  "1963b788318b4ab920816d8b79cff835")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPosition-request)))
  "Returns md5sum for a message object of type 'SetPosition-request"
  "1963b788318b4ab920816d8b79cff835")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPosition-request>)))
  "Returns full string definition for message of type '<SetPosition-request>"
  (cl:format cl:nil "uint8 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPosition-request)))
  "Returns full string definition for message of type 'SetPosition-request"
  (cl:format cl:nil "uint8 position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPosition-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPosition-request
    (cl:cons ':position (position msg))
))
;//! \htmlinclude SetPosition-response.msg.html

(cl:defclass <SetPosition-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetPosition-response (<SetPosition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPosition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPosition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<SetPosition-response> is deprecated: use robotiq_3f_srvs-srv:SetPosition-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetPosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:success-val is deprecated.  Use robotiq_3f_srvs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPosition-response>) ostream)
  "Serializes a message object of type '<SetPosition-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPosition-response>) istream)
  "Deserializes a message object of type '<SetPosition-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPosition-response>)))
  "Returns string type for a service object of type '<SetPosition-response>"
  "robotiq_3f_srvs/SetPositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPosition-response)))
  "Returns string type for a service object of type 'SetPosition-response"
  "robotiq_3f_srvs/SetPositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPosition-response>)))
  "Returns md5sum for a message object of type '<SetPosition-response>"
  "1963b788318b4ab920816d8b79cff835")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPosition-response)))
  "Returns md5sum for a message object of type 'SetPosition-response"
  "1963b788318b4ab920816d8b79cff835")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPosition-response>)))
  "Returns full string definition for message of type '<SetPosition-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPosition-response)))
  "Returns full string definition for message of type 'SetPosition-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPosition-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPosition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPosition-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPosition)))
  'SetPosition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPosition)))
  'SetPosition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPosition)))
  "Returns string type for a service object of type '<SetPosition>"
  "robotiq_3f_srvs/SetPosition")