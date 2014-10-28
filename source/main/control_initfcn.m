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

FxMax = 1;
FyMax = 1;
FzMax = 1;
TxMax = 1;
TyMax = 1;
TzMax = 1;

minTime = 0.1;
maxTime = 10;

%% Initial Values
initPositionRightArm = [0.7 -0.23 0.9];
initLoadMass = 1;
initLoadCenterOfGravity = [0 0 0];
initLoadInertia = [10 10 10 0 0 0]; % Ixx Iyy Izz Ixy Ixz Iyz

