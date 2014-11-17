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
stop = 47/Ts;
t = (start:stop)*Ts;
forces = FWrtLoad(start:stop,:);
gravitation = gWrtLoad(start:stop,:);
position = objectPosWC(start:stop,:);
rotation = objectRotWC(start:stop,:);
figure;
subplot(2, 2, 1);
plot(t, forces);
legend('fx','fy','fz');
title('forces in sensor coordinates');
subplot(2, 2, 3);
plot(t, gravitation);
legend('gx', 'gy', 'gz');
title('gravitation in sensor coordinates');
subplot(2, 2, 2);
plot(t, position);
legend('x', 'y', 'z');
title('position in world coordinates');
subplot(2, 2, 4);
plot(t, rotation);
legend('phix', 'phiy', 'phiz');
title('rotation in world coordinates');
figure;
mass = estimation(start:stop, 1);
centerOfGravity = estimation(start:stop, 2:4);
inertia = estimation(start:stop, 5:10);
subplot(1, 3, 1);
plot(t, mass);
title('mass');
subplot(1, 3, 2);
plot(t, centerOfGravity);
title('center of gravity');
legend('x', 'y', 'z');
subplot(1, 3, 3);
plot(t, inertia);
title('inertia');
legend('I_{xx}', 'I_{yy}', 'I_{zz}', 'I_{xy}', 'I_{xz}', 'I_{yz}');

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