#!/bin/bash
rtdb-stop
killall -9 kogmo_rtdb_man
killall -9 Qualisys2Simulink
killall -9 IceServerStarter
killall -9 IceServerGripper
killall -9 IceServerManipulation
killall -9 IceServerLocomotion
killall -9 QuattrobotControl
killall -9 GuiStarter
killall -9 GuiGripper
killall -9 GripperDriver

rtdb-start
Qualisys2Simulink & IceServerStarter & GuiStarter & GuiGripper
