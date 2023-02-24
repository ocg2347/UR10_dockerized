
"use strict";

let IsProgramRunning = require('./IsProgramRunning.js')
let Popup = require('./Popup.js')
let Load = require('./Load.js')
let IsProgramSaved = require('./IsProgramSaved.js')
let IsInRemoteControl = require('./IsInRemoteControl.js')
let RawRequest = require('./RawRequest.js')
let GetRobotMode = require('./GetRobotMode.js')
let GetLoadedProgram = require('./GetLoadedProgram.js')
let GetProgramState = require('./GetProgramState.js')
let AddToLog = require('./AddToLog.js')
let GetSafetyMode = require('./GetSafetyMode.js')

module.exports = {
  IsProgramRunning: IsProgramRunning,
  Popup: Popup,
  Load: Load,
  IsProgramSaved: IsProgramSaved,
  IsInRemoteControl: IsInRemoteControl,
  RawRequest: RawRequest,
  GetRobotMode: GetRobotMode,
  GetLoadedProgram: GetLoadedProgram,
  GetProgramState: GetProgramState,
  AddToLog: AddToLog,
  GetSafetyMode: GetSafetyMode,
};
