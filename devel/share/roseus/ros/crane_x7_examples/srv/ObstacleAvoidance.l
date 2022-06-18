;; Auto-generated. Do not edit!


(when (boundp 'crane_x7_examples::ObstacleAvoidance)
  (if (not (find-package "CRANE_X7_EXAMPLES"))
    (make-package "CRANE_X7_EXAMPLES"))
  (shadow 'ObstacleAvoidance (find-package "CRANE_X7_EXAMPLES")))
(unless (find-package "CRANE_X7_EXAMPLES::OBSTACLEAVOIDANCE")
  (make-package "CRANE_X7_EXAMPLES::OBSTACLEAVOIDANCE"))
(unless (find-package "CRANE_X7_EXAMPLES::OBSTACLEAVOIDANCEREQUEST")
  (make-package "CRANE_X7_EXAMPLES::OBSTACLEAVOIDANCEREQUEST"))
(unless (find-package "CRANE_X7_EXAMPLES::OBSTACLEAVOIDANCERESPONSE")
  (make-package "CRANE_X7_EXAMPLES::OBSTACLEAVOIDANCERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass crane_x7_examples::ObstacleAvoidanceRequest
  :super ros::object
  :slots (_start_pose _goal_pose _obstacle_enable _obstacle_size _obstacle_pose_stamped _obstacle_name ))

(defmethod crane_x7_examples::ObstacleAvoidanceRequest
  (:init
   (&key
    ((:start_pose __start_pose) (instance geometry_msgs::Pose :init))
    ((:goal_pose __goal_pose) (instance geometry_msgs::Pose :init))
    ((:obstacle_enable __obstacle_enable) nil)
    ((:obstacle_size __obstacle_size) (instance geometry_msgs::Vector3 :init))
    ((:obstacle_pose_stamped __obstacle_pose_stamped) (instance geometry_msgs::PoseStamped :init))
    ((:obstacle_name __obstacle_name) "")
    )
   (send-super :init)
   (setq _start_pose __start_pose)
   (setq _goal_pose __goal_pose)
   (setq _obstacle_enable __obstacle_enable)
   (setq _obstacle_size __obstacle_size)
   (setq _obstacle_pose_stamped __obstacle_pose_stamped)
   (setq _obstacle_name (string __obstacle_name))
   self)
  (:start_pose
   (&rest __start_pose)
   (if (keywordp (car __start_pose))
       (send* _start_pose __start_pose)
     (progn
       (if __start_pose (setq _start_pose (car __start_pose)))
       _start_pose)))
  (:goal_pose
   (&rest __goal_pose)
   (if (keywordp (car __goal_pose))
       (send* _goal_pose __goal_pose)
     (progn
       (if __goal_pose (setq _goal_pose (car __goal_pose)))
       _goal_pose)))
  (:obstacle_enable
   (&optional (__obstacle_enable :null))
   (if (not (eq __obstacle_enable :null)) (setq _obstacle_enable __obstacle_enable)) _obstacle_enable)
  (:obstacle_size
   (&rest __obstacle_size)
   (if (keywordp (car __obstacle_size))
       (send* _obstacle_size __obstacle_size)
     (progn
       (if __obstacle_size (setq _obstacle_size (car __obstacle_size)))
       _obstacle_size)))
  (:obstacle_pose_stamped
   (&rest __obstacle_pose_stamped)
   (if (keywordp (car __obstacle_pose_stamped))
       (send* _obstacle_pose_stamped __obstacle_pose_stamped)
     (progn
       (if __obstacle_pose_stamped (setq _obstacle_pose_stamped (car __obstacle_pose_stamped)))
       _obstacle_pose_stamped)))
  (:obstacle_name
   (&optional __obstacle_name)
   (if __obstacle_name (setq _obstacle_name __obstacle_name)) _obstacle_name)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _start_pose
    (send _start_pose :serialization-length)
    ;; geometry_msgs/Pose _goal_pose
    (send _goal_pose :serialization-length)
    ;; bool _obstacle_enable
    1
    ;; geometry_msgs/Vector3 _obstacle_size
    (send _obstacle_size :serialization-length)
    ;; geometry_msgs/PoseStamped _obstacle_pose_stamped
    (send _obstacle_pose_stamped :serialization-length)
    ;; string _obstacle_name
    4 (length _obstacle_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _start_pose
       (send _start_pose :serialize s)
     ;; geometry_msgs/Pose _goal_pose
       (send _goal_pose :serialize s)
     ;; bool _obstacle_enable
       (if _obstacle_enable (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Vector3 _obstacle_size
       (send _obstacle_size :serialize s)
     ;; geometry_msgs/PoseStamped _obstacle_pose_stamped
       (send _obstacle_pose_stamped :serialize s)
     ;; string _obstacle_name
       (write-long (length _obstacle_name) s) (princ _obstacle_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _start_pose
     (send _start_pose :deserialize buf ptr-) (incf ptr- (send _start_pose :serialization-length))
   ;; geometry_msgs/Pose _goal_pose
     (send _goal_pose :deserialize buf ptr-) (incf ptr- (send _goal_pose :serialization-length))
   ;; bool _obstacle_enable
     (setq _obstacle_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Vector3 _obstacle_size
     (send _obstacle_size :deserialize buf ptr-) (incf ptr- (send _obstacle_size :serialization-length))
   ;; geometry_msgs/PoseStamped _obstacle_pose_stamped
     (send _obstacle_pose_stamped :deserialize buf ptr-) (incf ptr- (send _obstacle_pose_stamped :serialization-length))
   ;; string _obstacle_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _obstacle_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass crane_x7_examples::ObstacleAvoidanceResponse
  :super ros::object
  :slots (_result ))

(defmethod crane_x7_examples::ObstacleAvoidanceResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass crane_x7_examples::ObstacleAvoidance
  :super ros::object
  :slots ())

(setf (get crane_x7_examples::ObstacleAvoidance :md5sum-) "72c38d661db946d478d0ae7732add5d5")
(setf (get crane_x7_examples::ObstacleAvoidance :datatype-) "crane_x7_examples/ObstacleAvoidance")
(setf (get crane_x7_examples::ObstacleAvoidance :request) crane_x7_examples::ObstacleAvoidanceRequest)
(setf (get crane_x7_examples::ObstacleAvoidance :response) crane_x7_examples::ObstacleAvoidanceResponse)

(defmethod crane_x7_examples::ObstacleAvoidanceRequest
  (:response () (instance crane_x7_examples::ObstacleAvoidanceResponse :init)))

(setf (get crane_x7_examples::ObstacleAvoidanceRequest :md5sum-) "72c38d661db946d478d0ae7732add5d5")
(setf (get crane_x7_examples::ObstacleAvoidanceRequest :datatype-) "crane_x7_examples/ObstacleAvoidanceRequest")
(setf (get crane_x7_examples::ObstacleAvoidanceRequest :definition-)
      "# target pose for the arm
geometry_msgs/Pose          start_pose
geometry_msgs/Pose          goal_pose

# the obstacle shape is BOX
bool                        obstacle_enable
geometry_msgs/Vector3       obstacle_size
geometry_msgs/PoseStamped   obstacle_pose_stamped
string                      obstacle_name

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
bool                        result

")

(setf (get crane_x7_examples::ObstacleAvoidanceResponse :md5sum-) "72c38d661db946d478d0ae7732add5d5")
(setf (get crane_x7_examples::ObstacleAvoidanceResponse :datatype-) "crane_x7_examples/ObstacleAvoidanceResponse")
(setf (get crane_x7_examples::ObstacleAvoidanceResponse :definition-)
      "# target pose for the arm
geometry_msgs/Pose          start_pose
geometry_msgs/Pose          goal_pose

# the obstacle shape is BOX
bool                        obstacle_enable
geometry_msgs/Vector3       obstacle_size
geometry_msgs/PoseStamped   obstacle_pose_stamped
string                      obstacle_name

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
bool                        result

")



(provide :crane_x7_examples/ObstacleAvoidance "72c38d661db946d478d0ae7732add5d5")


