#!/bin/bash
cd ~/murola/src/actuators/manipulation/drivers/armInitialization 
newInitialization JointInitialization.xml
cd ~/wearhap/src/actuators/manipulation/accrea/FTSInitialization
./new_goto_qa
./FTS_dual_Initialization
cd

