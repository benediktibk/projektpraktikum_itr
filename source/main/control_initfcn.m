%% Includes
addpath('rot2Q/')

%% Sampling Time Ts 
Ts = 0.001;


%% Stream IDs
% To be found in wearhap/src/arch/rtdbobjects/ManipulationCommand.h
% Vectotr indices can be derived from respective entriers in wearhap/src/arch/rtdbobjects/ManipulationCommand.cpp

% Pose Stream ID    vector:[6,x,y,z,q1,q2,q3,q4,elbow,time,zeros(1,13)]
MANIPULATION_CMD_CONFIGURATION = 6;

% Velocity Stream ID    vector:[102,dx,dy,dz,wx,wy,wz,elbow,zeros(1,15)]
MANIPULATION_CMD_CONFIGURATION_VELOCITY = 102;

dx = 0;
dy = 0.005;
dz = 0;
ox = 0;
oy = 0;
oz = 0;
elbow = 0;

testVelocity = [MANIPULATION_CMD_CONFIGURATION_VELOCITY dx dy dz ox oy oz elbow zeros(1,15)];

%% Initial Pose
initPoseRightArm = [6 .7 -.23 .9 1 0 0 0  0 10 zeros(1,13)];