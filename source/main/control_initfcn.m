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

%% Actuator Limits
vxMax = 0.01;
vyMax = 0.01;
vzMax = 0.01;
wxMax = 0.01;
wyMax = 0.01;
wzMax = 0.01;

offsetx = 0.7;
offsety = -0.23;
offsetz = 0.9;

xMin = -0.1 + offsetx;  
xMax = 0.5 + offsetx;
yMin = -0.5 + offsety;
yMax = 0.5 + offsety;
zMin = -0.5 + offsetz;
zMax = 0.5 + offsetz;

dx = 0;
dy = 0.005;
dz = 0;
ox = 0;
oy = 0;
oz = 0;
elbow = 0;

minTime = 0.1;
maxTime = 10;

testVelocity = [MANIPULATION_CMD_CONFIGURATION_VELOCITY dx dy dz ox oy oz elbow zeros(1,15)];

%% Initial Pose
initPoseRightArm = [6 .7 -.23 .9 1 0 0 0  0 10 zeros(1,13)];