// Auto-generated. Do not edit!

// (in-package crane_x7_examples.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ObstacleAvoidanceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start_pose = null;
      this.goal_pose = null;
      this.obstacle_enable = null;
      this.obstacle_size = null;
      this.obstacle_pose_stamped = null;
      this.obstacle_name = null;
    }
    else {
      if (initObj.hasOwnProperty('start_pose')) {
        this.start_pose = initObj.start_pose
      }
      else {
        this.start_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('goal_pose')) {
        this.goal_pose = initObj.goal_pose
      }
      else {
        this.goal_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('obstacle_enable')) {
        this.obstacle_enable = initObj.obstacle_enable
      }
      else {
        this.obstacle_enable = false;
      }
      if (initObj.hasOwnProperty('obstacle_size')) {
        this.obstacle_size = initObj.obstacle_size
      }
      else {
        this.obstacle_size = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('obstacle_pose_stamped')) {
        this.obstacle_pose_stamped = initObj.obstacle_pose_stamped
      }
      else {
        this.obstacle_pose_stamped = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('obstacle_name')) {
        this.obstacle_name = initObj.obstacle_name
      }
      else {
        this.obstacle_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleAvoidanceRequest
    // Serialize message field [start_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.start_pose, buffer, bufferOffset);
    // Serialize message field [goal_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.goal_pose, buffer, bufferOffset);
    // Serialize message field [obstacle_enable]
    bufferOffset = _serializer.bool(obj.obstacle_enable, buffer, bufferOffset);
    // Serialize message field [obstacle_size]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.obstacle_size, buffer, bufferOffset);
    // Serialize message field [obstacle_pose_stamped]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.obstacle_pose_stamped, buffer, bufferOffset);
    // Serialize message field [obstacle_name]
    bufferOffset = _serializer.string(obj.obstacle_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleAvoidanceRequest
    let len;
    let data = new ObstacleAvoidanceRequest(null);
    // Deserialize message field [start_pose]
    data.start_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal_pose]
    data.goal_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [obstacle_enable]
    data.obstacle_enable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [obstacle_size]
    data.obstacle_size = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [obstacle_pose_stamped]
    data.obstacle_pose_stamped = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [obstacle_name]
    data.obstacle_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.obstacle_pose_stamped);
    length += _getByteLength(object.obstacle_name);
    return length + 141;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crane_x7_examples/ObstacleAvoidanceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1f107495b21e60af9baa011dd99ed578';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # target pose for the arm
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleAvoidanceRequest(null);
    if (msg.start_pose !== undefined) {
      resolved.start_pose = geometry_msgs.msg.Pose.Resolve(msg.start_pose)
    }
    else {
      resolved.start_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.goal_pose !== undefined) {
      resolved.goal_pose = geometry_msgs.msg.Pose.Resolve(msg.goal_pose)
    }
    else {
      resolved.goal_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.obstacle_enable !== undefined) {
      resolved.obstacle_enable = msg.obstacle_enable;
    }
    else {
      resolved.obstacle_enable = false
    }

    if (msg.obstacle_size !== undefined) {
      resolved.obstacle_size = geometry_msgs.msg.Vector3.Resolve(msg.obstacle_size)
    }
    else {
      resolved.obstacle_size = new geometry_msgs.msg.Vector3()
    }

    if (msg.obstacle_pose_stamped !== undefined) {
      resolved.obstacle_pose_stamped = geometry_msgs.msg.PoseStamped.Resolve(msg.obstacle_pose_stamped)
    }
    else {
      resolved.obstacle_pose_stamped = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.obstacle_name !== undefined) {
      resolved.obstacle_name = msg.obstacle_name;
    }
    else {
      resolved.obstacle_name = ''
    }

    return resolved;
    }
};

class ObstacleAvoidanceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObstacleAvoidanceResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObstacleAvoidanceResponse
    let len;
    let data = new ObstacleAvoidanceResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'crane_x7_examples/ObstacleAvoidanceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool                        result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObstacleAvoidanceResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ObstacleAvoidanceRequest,
  Response: ObstacleAvoidanceResponse,
  md5sum() { return '72c38d661db946d478d0ae7732add5d5'; },
  datatype() { return 'crane_x7_examples/ObstacleAvoidance'; }
};
