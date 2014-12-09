#!/bin/bash
cd ~/wearhap/src/actuators/manipulation/accrea/armInitialization 
newInitialization JointInitialization.xml
cd ~/wearhap/src/actuators/manipulation/accrea/FTSInitialization
./new_goto_qa
./FTS_dual_Initialization
cd

