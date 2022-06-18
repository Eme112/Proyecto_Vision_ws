; Auto-generated. Do not edit!


(cl:in-package crane_x7_examples-srv)


;//! \htmlinclude ObstacleAvoidance-request.msg.html

(cl:defclass <ObstacleAvoidance-request> (roslisp-msg-protocol:ros-message)
  ((start_pose
    :reader start_pose
    :initarg :start_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (goal_pose
    :reader goal_pose
    :initarg :goal_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (obstacle_enable
    :reader obstacle_enable
    :initarg :obstacle_enable
    :type cl:boolean
    :initform cl:nil)
   (obstacle_size
    :reader obstacle_size
    :initarg :obstacle_size
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (obstacle_pose_stamped
    :reader obstacle_pose_stamped
    :initarg :obstacle_pose_stamped
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (obstacle_name
    :reader obstacle_name
    :initarg :obstacle_name
    :type cl:string
    :initform ""))
)

(cl:defclass ObstacleAvoidance-request (<ObstacleAvoidance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleAvoidance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleAvoidance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crane_x7_examples-srv:<ObstacleAvoidance-request> is deprecated: use crane_x7_examples-srv:ObstacleAvoidance-request instead.")))

(cl:ensure-generic-function 'start_pose-val :lambda-list '(m))
(cl:defmethod start_pose-val ((m <ObstacleAvoidance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crane_x7_examples-srv:start_pose-val is deprecated.  Use crane_x7_examples-srv:start_pose instead.")
  (start_pose m))

(cl:ensure-generic-function 'goal_pose-val :lambda-list '(m))
(cl:defmethod goal_pose-val ((m <ObstacleAvoidance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crane_x7_examples-srv:goal_pose-val is deprecated.  Use crane_x7_examples-srv:goal_pose instead.")
  (goal_pose m))

(cl:ensure-generic-function 'obstacle_enable-val :lambda-list '(m))
(cl:defmethod obstacle_enable-val ((m <ObstacleAvoidance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crane_x7_examples-srv:obstacle_enable-val is deprecated.  Use crane_x7_examples-srv:obstacle_enable instead.")
  (obstacle_enable m))

(cl:ensure-generic-function 'obstacle_size-val :lambda-list '(m))
(cl:defmethod obstacle_size-val ((m <ObstacleAvoidance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crane_x7_examples-srv:obstacle_size-val is deprecated.  Use crane_x7_examples-srv:obstacle_size instead.")
  (obstacle_size m))

(cl:ensure-generic-function 'obstacle_pose_stamped-val :lambda-list '(m))
(cl:defmethod obstacle_pose_stamped-val ((m <ObstacleAvoidance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crane_x7_examples-srv:obstacle_pose_stamped-val is deprecated.  Use crane_x7_examples-srv:obstacle_pose_stamped instead.")
  (obstacle_pose_stamped m))

(cl:ensure-generic-function 'obstacle_name-val :lambda-list '(m))
(cl:defmethod obstacle_name-val ((m <ObstacleAvoidance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crane_x7_examples-srv:obstacle_name-val is deprecated.  Use crane_x7_examples-srv:obstacle_name instead.")
  (obstacle_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleAvoidance-request>) ostream)
  "Serializes a message object of type '<ObstacleAvoidance-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal_pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'obstacle_enable) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'obstacle_size) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'obstacle_pose_stamped) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'obstacle_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'obstacle_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleAvoidance-request>) istream)
  "Deserializes a message object of type '<ObstacleAvoidance-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal_pose) istream)
    (cl:setf (cl:slot-value msg 'obstacle_enable) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'obstacle_size) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'obstacle_pose_stamped) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'obstacle_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'obstacle_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleAvoidance-request>)))
  "Returns string type for a service object of type '<ObstacleAvoidance-request>"
  "crane_x7_examples/ObstacleAvoidanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleAvoidance-request)))
  "Returns string type for a service object of type 'ObstacleAvoidance-request"
  "crane_x7_examples/ObstacleAvoidanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleAvoidance-request>)))
  "Returns md5sum for a message object of type '<ObstacleAvoidance-request>"
  "72c38d661db946d478d0ae7732add5d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleAvoidance-request)))
  "Returns md5sum for a message object of type 'ObstacleAvoidance-request"
  "72c38d661db946d478d0ae7732add5d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleAvoidance-request>)))
  "Returns full string definition for message of type '<ObstacleAvoidance-request>"
  (cl:format cl:nil "# target pose for the arm~%geometry_msgs/Pose          start_pose~%geometry_msgs/Pose          goal_pose~%~%# the obstacle shape is BOX~%bool                        obstacle_enable~%geometry_msgs/Vector3       obstacle_size~%geometry_msgs/PoseStamped   obstacle_pose_stamped~%string                      obstacle_name~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleAvoidance-request)))
  "Returns full string definition for message of type 'ObstacleAvoidance-request"
  (cl:format cl:nil "# target pose for the arm~%geometry_msgs/Pose          start_pose~%geometry_msgs/Pose          goal_pose~%~%# the obstacle shape is BOX~%bool                        obstacle_enable~%geometry_msgs/Vector3       obstacle_size~%geometry_msgs/PoseStamped   obstacle_pose_stamped~%string                      obstacle_name~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleAvoidance-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal_pose))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'obstacle_size))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'obstacle_pose_stamped))
     4 (cl:length (cl:slot-value msg 'obstacle_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleAvoidance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleAvoidance-request
    (cl:cons ':start_pose (start_pose msg))
    (cl:cons ':goal_pose (goal_pose msg))
    (cl:cons ':obstacle_enable (obstacle_enable msg))
    (cl:cons ':obstacle_size (obstacle_size msg))
    (cl:cons ':obstacle_pose_stamped (obstacle_pose_stamped msg))
    (cl:cons ':obstacle_name (obstacle_name msg))
))
;//! \htmlinclude ObstacleAvoidance-response.msg.html

(cl:defclass <ObstacleAvoidance-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ObstacleAvoidance-response (<ObstacleAvoidance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObstacleAvoidance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObstacleAvoidance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name crane_x7_examples-srv:<ObstacleAvoidance-response> is deprecated: use crane_x7_examples-srv:ObstacleAvoidance-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ObstacleAvoidance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader crane_x7_examples-srv:result-val is deprecated.  Use crane_x7_examples-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObstacleAvoidance-response>) ostream)
  "Serializes a message object of type '<ObstacleAvoidance-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObstacleAvoidance-response>) istream)
  "Deserializes a message object of type '<ObstacleAvoidance-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObstacleAvoidance-response>)))
  "Returns string type for a service object of type '<ObstacleAvoidance-response>"
  "crane_x7_examples/ObstacleAvoidanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleAvoidance-response)))
  "Returns string type for a service object of type 'ObstacleAvoidance-response"
  "crane_x7_examples/ObstacleAvoidanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObstacleAvoidance-response>)))
  "Returns md5sum for a message object of type '<ObstacleAvoidance-response>"
  "72c38d661db946d478d0ae7732add5d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObstacleAvoidance-response)))
  "Returns md5sum for a message object of type 'ObstacleAvoidance-response"
  "72c38d661db946d478d0ae7732add5d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObstacleAvoidance-response>)))
  "Returns full string definition for message of type '<ObstacleAvoidance-response>"
  (cl:format cl:nil "bool                        result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObstacleAvoidance-response)))
  "Returns full string definition for message of type 'ObstacleAvoidance-response"
  (cl:format cl:nil "bool                        result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObstacleAvoidance-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObstacleAvoidance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ObstacleAvoidance-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ObstacleAvoidance)))
  'ObstacleAvoidance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ObstacleAvoidance)))
  'ObstacleAvoidance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObstacleAvoidance)))
  "Returns string type for a service object of type '<ObstacleAvoidance>"
  "crane_x7_examples/ObstacleAvoidance")