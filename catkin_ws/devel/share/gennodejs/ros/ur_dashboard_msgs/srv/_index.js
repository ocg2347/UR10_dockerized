
"use strict";

let IsProgramSaved = require('./IsProgramSaved.js')
let Load = require('./Load.js')
let IsInRemoteControl = require('./IsInRemoteControl.js')
let GetRobotMode = require('./GetRobotMode.js')
let IsProgramRunning = require('./IsProgramRunning.js')
let GetProgramState = require('./GetProgramState.js')
let RawRequest = require('./RawRequest.js')
let AddToLog = require('./AddToLog.js')
let GetLoadedProgram = require('./GetLoadedProgram.js')
let Popup = require('./Popup.js')
let GetSafetyMode = require('./GetSafetyMode.js')

module.exports = {
  IsProgramSaved: IsProgramSaved,
  Load: Load,
  IsInRemoteControl: IsInRemoteControl,
  GetRobotMode: GetRobotMode,
  IsProgramRunning: IsProgramRunning,
  GetProgramState: GetProgramState,
  RawRequest: RawRequest,
  AddToLog: AddToLog,
  GetLoadedProgram: GetLoadedProgram,
  Popup: Popup,
  GetSafetyMode: GetSafetyMode,
};
