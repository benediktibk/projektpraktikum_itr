clc
close all
clearvars -EXCEPT Ts initPoseRightArm dataLoggerStartTime dataLoggerStopTime



files = dir('*.dat');

for i=1:length(files)
    eval(['load ' files(i).name ' -ascii']);
end


start = 1;
stop = 50000;

%L = length(theta_star);
%t= 0:0.001:(L-1)*0.001;
y = objectPosWC(start:stop,1);
L = length(y);
t= 0:0.001:(L-1)*0.001;
ysm = smooth(y,0.01,'loess');
dv= diff(ysm);
dt =diff(t)';
vel = dv./dt;
plot(vel)
hold on

plot(filt2(start:stop,1),'r')
plot(filt5(start:stop,1),'g')