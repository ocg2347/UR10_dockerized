; Auto-generated. Do not edit!


(cl:in-package robotiq_3f_srvs-srv)


;//! \htmlinclude GetMode-request.msg.html

(cl:defclass <GetMode-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetMode-request (<GetMode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<GetMode-request> is deprecated: use robotiq_3f_srvs-srv:GetMode-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMode-request>) ostream)
  "Serializes a message object of type '<GetMode-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMode-request>) istream)
  "Deserializes a message object of type '<GetMode-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMode-request>)))
  "Returns string type for a service object of type '<GetMode-request>"
  "robotiq_3f_srvs/GetModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMode-request)))
  "Returns string type for a service object of type 'GetMode-request"
  "robotiq_3f_srvs/GetModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMode-request>)))
  "Returns md5sum for a message object of type '<GetMode-request>"
  "0c8272edd1805ed053997f57be90c52f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMode-request)))
  "Returns md5sum for a message object of type 'GetMode-request"
  "0c8272edd1805ed053997f57be90c52f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMode-request>)))
  "Returns full string definition for message of type '<GetMode-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMode-request)))
  "Returns full string definition for message of type 'GetMode-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMode-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMode-request
))
;//! \htmlinclude GetMode-response.msg.html

(cl:defclass <GetMode-response> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform "")
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GetMode-response (<GetMode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_3f_srvs-srv:<GetMode-response> is deprecated: use robotiq_3f_srvs-srv:GetMode-response instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <GetMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:mode-val is deprecated.  Use robotiq_3f_srvs-srv:mode instead.")
  (mode m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetMode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_3f_srvs-srv:success-val is deprecated.  Use robotiq_3f_srvs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMode-response>) ostream)
  "Serializes a message object of type '<GetMode-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMode-response>) istream)
  "Deserializes a message object of type '<GetMode-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMode-response>)))
  "Returns string type for a service object of type '<GetMode-response>"
  "robotiq_3f_srvs/GetModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMode-response)))
  "Returns string type for a service object of type 'GetMode-response"
  "robotiq_3f_srvs/GetModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMode-response>)))
  "Returns md5sum for a message object of type '<GetMode-response>"
  "0c8272edd1805ed053997f57be90c52f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMode-response)))
  "Returns md5sum for a message object of type 'GetMode-response"
  "0c8272edd1805ed053997f57be90c52f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMode-response>)))
  "Returns full string definition for message of type '<GetMode-response>"
  (cl:format cl:nil "string mode~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMode-response)))
  "Returns full string definition for message of type 'GetMode-response"
  (cl:format cl:nil "string mode~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMode-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mode))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMode-response
    (cl:cons ':mode (mode msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetMode)))
  'GetMode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetMode)))
  'GetMode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMode)))
  "Returns string type for a service object of type '<GetMode>"
  "robotiq_3f_srvs/GetMode")