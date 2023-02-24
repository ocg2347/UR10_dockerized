; Auto-generated. Do not edit!


(cl:in-package robotiq_3f_srvs-srv)


;//! \htmlinclude SetSpeed-request.msg.html

(cl:defclass <SetSpeed-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetSpeed-request (<SetSpeed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSpeed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSpeed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<SetSpeed-request> is deprecated: use robotiq_3f_srvs-srv:SetSpeed-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <SetSpeed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:speed-val is deprecated.  Use robotiq_3f_srvs-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSpeed-request>) ostream)
  "Serializes a message object of type '<SetSpeed-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSpeed-request>) istream)
  "Deserializes a message object of type '<SetSpeed-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'speed)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSpeed-request>)))
  "Returns string type for a service object of type '<SetSpeed-request>"
  "robotiq_3f_srvs/SetSpeedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSpeed-request)))
  "Returns string type for a service object of type 'SetSpeed-request"
  "robotiq_3f_srvs/SetSpeedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSpeed-request>)))
  "Returns md5sum for a message object of type '<SetSpeed-request>"
  "0ac8fdc96972cecc8d4bedcd2935d6ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSpeed-request)))
  "Returns md5sum for a message object of type 'SetSpeed-request"
  "0ac8fdc96972cecc8d4bedcd2935d6ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSpeed-request>)))
  "Returns full string definition for message of type '<SetSpeed-request>"
  (cl:format cl:nil "uint8 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSpeed-request)))
  "Returns full string definition for message of type 'SetSpeed-request"
  (cl:format cl:nil "uint8 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSpeed-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSpeed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSpeed-request
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude SetSpeed-response.msg.html

(cl:defclass <SetSpeed-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetSpeed-response (<SetSpeed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSpeed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSpeed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<SetSpeed-response> is deprecated: use robotiq_3f_srvs-srv:SetSpeed-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetSpeed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:success-val is deprecated.  Use robotiq_3f_srvs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSpeed-response>) ostream)
  "Serializes a message object of type '<SetSpeed-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSpeed-response>) istream)
  "Deserializes a message object of type '<SetSpeed-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSpeed-response>)))
  "Returns string type for a service object of type '<SetSpeed-response>"
  "robotiq_3f_srvs/SetSpeedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSpeed-response)))
  "Returns string type for a service object of type 'SetSpeed-response"
  "robotiq_3f_srvs/SetSpeedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSpeed-response>)))
  "Returns md5sum for a message object of type '<SetSpeed-response>"
  "0ac8fdc96972cecc8d4bedcd2935d6ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSpeed-response)))
  "Returns md5sum for a message object of type 'SetSpeed-response"
  "0ac8fdc96972cecc8d4bedcd2935d6ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSpeed-response>)))
  "Returns full string definition for message of type '<SetSpeed-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSpeed-response)))
  "Returns full string definition for message of type 'SetSpeed-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSpeed-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSpeed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSpeed-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSpeed)))
  'SetSpeed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSpeed)))
  'SetSpeed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSpeed)))
  "Returns string type for a service object of type '<SetSpeed>"
  "robotiq_3f_srvs/SetSpeed")