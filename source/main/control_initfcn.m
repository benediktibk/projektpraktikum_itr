%% Includes
addpath('rot2Q/')
addpath('../common/')

%% ArmSide (right:0  left:1)
armSide = 0;

%% General Constants
g = [0 0 -9.81]';

%% Sampling Time Ts 
Ts = 0.01;

%% Data Logging
dataLoggerStartTime = 1;
dataLoggerStopTime = 100;
 
%% Stream IDs
% To be found in wearhap/src/arch/rtdbobjects/ManipulationCommand.h
% Vectotr indices can be derived from respective entriers in wearhap/src/arch/rtdbobjects/ManipulationCommand.cpp

% Pose Stream ID    vector:[6,x,y,z,q1,q2,q3,q4,elbow,time,zeros(1,13)]
MANIPULATION_CMD_CONFIGURATION = 6;

% Velocity Stream ID    vector:[102,dx,dy,dz,wx,wy,wz,elbow,zeros(1,15)]
MANIPULATION_CMD_CONFIGURATION_VELOCITY = 102;

timeForMovement = 5;

%% Actuator Limits
vxMax = 0.5;
vyMax = 0.5;
vzMax = 0.5;
wxMax = 0.5;
wyMax = 0.5;
wzMax = 0.5;

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
initPositionRightArm = [0.7 -0.23 1];
initOrientationRightArmOne = [0 1 0 0];
initOrientationRightArmTwo = [1 0 0 0];
initPositionLeftArm = [0.7 0.23 1];
initOrientationLeftArmOne = [0 1 0 0];
initOrientationLeftArmTwo = [1 0 0 0];
initializationTime = timeForMovement + 4;

%% Filter Properties [rad/s]
cutOffFrequ = 20;

%% Estimation Trajectory Properties

maximumRotation = pi/180*[45;10;20];

translationAmplitude = 0*[0.005;0.02;0.01];
rotationAmplitude = [pi/10;pi/20;0];


translationFrequency = [1.0472;0.6283;1.0472];
rotationFrequency = rotationAmplitude./maximumRotation*2;
translationPhaseShift = [0;0;0];
rotationPhaseShift =[pi;0;0];
rampTime = 2;

%% Estimation Properties
forgettingFactor = 1e-2;

