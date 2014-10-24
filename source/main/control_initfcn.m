%% Includes
addpath('rot2Q/')

%% Sampling Time Ts 
Ts = 0.001;

%% Initial Poses
initPoseRightArm = [6 .7 -.23 .9 1 0 0 0  0 10 zeros(1,13)];

%% Velocity Stream ID
% Can be found in one of the headders of the sfunction
MANIPULATION_CMD_CONFIGURATION_VELOCITY = 102;

dx = 0;
dy = 0.005;
dz = 0;
ox = 0;
oy = 0;
oz = 0;
elbow = 0;

testVelocity = [MANIPULATION_CMD_CONFIGURATION_VELOCITY dx dy dz ox oy oz elbow zeros(1,15)];