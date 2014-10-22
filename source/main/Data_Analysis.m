clc
close all
clearvars -EXCEPT Ts initPoseRightArm



files = dir('*.dat');

for i=1:length(files)
    eval(['load ' files(i).name ' -ascii']);
end