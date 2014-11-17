%% clean up from previous runs
clc
close all
clearvars -EXCEPT Ts initPoseRightArm dataLoggerStartTime dataLoggerStopTime

%% load all files
files = dir('*.dat');

for i=1:length(files)
    eval(['load ' files(i).name ' -ascii']);
end

%% plot some useful graphs
Ts = 0.001;
start = 25/Ts;
stop = 80/Ts;
t = (start:stop)*Ts;
forces = FWrtLoad(start:stop,:);
gravitation = gWrtLoad(start:stop,:);
plot(t, forces);
legend('fx','fy','fz');
figure;
plot(t, gravitation);
legend('gx', 'gy', 'gz');

% start = 1;
% stop = 50000;
% 
% L = length(theta_star);
% t= 0:0.001:(L-1)*0.001;
% y = objectPosWC(start:stop,1);
% L = length(y);
% t= 0:0.001:(L-1)*0.001;
% ysm = smooth(y,0.01,'loess');
% dv= diff(ysm);
% dt =diff(t)';
% vel = dv./dt;
% plot(vel)
% hold on
% 
% plot(filt2(start:stop,1),'r')
% plot(filt5(start:stop,1),'g')