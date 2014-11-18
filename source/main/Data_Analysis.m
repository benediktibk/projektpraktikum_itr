%% clean up from previous runs
clc
close all
clearvars -EXCEPT Ts initPoseRightArm dataLoggerStartTime dataLoggerStopTime Ts

control_initfcn

%% load all files
files = dir('*.dat');

for i=1:length(files)
    eval(['load ' files(i).name ' -ascii']);
end

%% determine start and stop time

start = 25/Ts;

runTimeStart = -1;
stop = -1;
for i = 1:length(runTime)
    if runTime(i) > 0
        runTimeStart = i;
    end    
    if runTime(i) == 0 && runTimeStart > 0 && stop < 0
        stop = i-1;
    end
end

if stop < 0
    display('could not find stop time');
    stop = 50/Ts;
end    

t = (start:stop)*Ts;

%% plot input data
forces = EEFForBase(start:stop,:);
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

%% plot estimated kinematics
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

%% plot filtered data
positionRaw = objectPosWC(start:stop, :);
positionPerfectFiltered = [smooth(positionRaw(:, 1),0.01,'loess'), smooth(positionRaw(:, 2),0.01,'loess'), smooth(positionRaw(:, 3),0.01,'loess')];
dv = [diff(positionPerfectFiltered(:, 1)), diff(positionPerfectFiltered(:, 2)), diff(positionPerfectFiltered(:, 3))];
dt = diff(t)';
velocityPerfectFiltered = [dv(:, 1)./dt, dv(:, 2)./dt, dv(:, 3)./dt];

figure;
subplot(2, 2, 1);
plot(t, positionRaw);
title('position unfiltered');
subplot(2, 2, 3);
plot(t, positionPerfectFiltered);
title('position perfect filtered');
subplot(2, 2, 4);
plot(t(1:end-1), velocityPerfectFiltered);
title('velocity perfect filtered');
subplot(2, 2, 2);
plot(t, velFilt(start:stop, :));
title('velocity filtered');

figure;
plot(t, accFilt(start:stop,:));
title('acceleration filtered');
legend('x', 'y', 'z');