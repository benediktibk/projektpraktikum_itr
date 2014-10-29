clc
close all
clearvars -EXCEPT Ts initPoseRightArm dataLoggerStartTime dataLoggerStopTime



files = dir('*.dat');

for i=1:length(files)
    eval(['load ' files(i).name ' -ascii']);
end

start = find(active,1);


%L = length(theta_star);
%t= 0:0.001:(L-1)*0.001;
