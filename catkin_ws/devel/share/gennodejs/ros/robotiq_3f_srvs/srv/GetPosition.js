// Auto-generated. Do not edit!

// (in-package robotiq_3f_srvs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetPositionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPositionRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPositionRequest
    let len;
    let data = new GetPositionRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robotiq_3f_srvs/GetPositionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPositionRequest(null);
    return resolved;
    }
};

class GetPositionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_position = null;
      this.finger_a_position = null;
      this.finger_b_position = null;
      this.finger_c_position = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('target_position')) {
        this.target_position = initObj.target_position
      }
      else {
        this.target_position = 0;
      }
      if (initObj.hasOwnProperty('finger_a_position')) {
        this.finger_a_position = initObj.finger_a_position
      }
      else {
        this.finger_a_position = 0;
      }
      if (initObj.hasOwnProperty('finger_b_position')) {
        this.finger_b_position = initObj.finger_b_position
      }
      else {
        this.finger_b_position = 0;
      }
      if (initObj.hasOwnProperty('finger_c_position')) {
        this.finger_c_position = initObj.finger_c_position
      }
      else {
        this.finger_c_position = 0;
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPositionResponse
    // Serialize message field [target_position]
    bufferOffset = _serializer.uint8(obj.target_position, buffer, bufferOffset);
    // Serialize message field [finger_a_position]
    bufferOffset = _serializer.uint8(obj.finger_a_position, buffer, bufferOffset);
    // Serialize message field [finger_b_position]
    bufferOffset = _serializer.uint8(obj.finger_b_position, buffer, bufferOffset);
    // Serialize message field [finger_c_position]
    bufferOffset = _serializer.uint8(obj.finger_c_position, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPositionResponse
    let len;
    let data = new GetPositionResponse(null);
    // Deserialize message field [target_position]
    data.target_position = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [finger_a_position]
    data.finger_a_position = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [finger_b_position]
    data.finger_b_position = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [finger_c_position]
    data.finger_c_position = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robotiq_3f_srvs/GetPositionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '15af47e08a021b42de872282bf4961e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 target_position
    uint8 finger_a_position
    uint8 finger_b_position
    uint8 finger_c_position
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPositionResponse(null);
    if (msg.target_position !== undefined) {
      resolved.target_position = msg.target_position;
    }
    else {
      resolved.target_position = 0
    }

    if (msg.finger_a_position !== undefined) {
      resolved.finger_a_position = msg.finger_a_position;
    }
    else {
      resolved.finger_a_position = 0
    }

    if (msg.finger_b_position !== undefined) {
      resolved.finger_b_position = msg.finger_b_position;
    }
    else {
      resolved.finger_b_position = 0
    }

    if (msg.finger_c_position !== undefined) {
      resolved.finger_c_position = msg.finger_c_position;
    }
    else {
      resolved.finger_c_position = 0
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: GetPositionRequest,
  Response: GetPositionResponse,
  md5sum() { return '15af47e08a021b42de872282bf4961e5'; },
  datatype() { return 'robotiq_3f_srvs/GetPosition'; }
};
