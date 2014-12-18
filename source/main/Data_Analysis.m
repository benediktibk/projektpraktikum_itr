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
start = -1;
for i = 1:length(estTime)
    if estTime(i) > 0 && start < 0
        start = i;
    end    
end

if start < 0
    display('could not find start time');
    start = initializationTime/Ts;
end 

stop = -1;
for i = start:length(estTime)
    if estTime(i) == 0 && stop < 0
        stop = i-1;
    end
end

if stop < 0
    display('could not find stop time');
    stop = 50/Ts;
end    

t = (start:stop)*Ts;
startTime = start*Ts;
stopTime = stop*Ts;

%% plot input data
forces = EEFForSens(start:stop,:);
gravitation = gWrtLoad(start:stop,:);
position = objectPosWC(start:stop,:);
rotation = objectRotWC(start:stop,:);
figure;
subplot(2, 2, 1);
plot(t, forces);
legend('fx','fy','fz');
title('forces in sensor coordinates');
axis([startTime stopTime, -10, 10]);
subplot(2, 2, 3);
plot(t, gravitation);
legend('gx', 'gy', 'gz');
axis([startTime stopTime, -12, 12]);
title('gravitation in sensor coordinates');
subplot(2, 2, 2);
plot(t, position);
legend('x', 'y', 'z');
title('position in world coordinates');
axis([startTime stopTime, 0, 2.5]);
subplot(2, 2, 4);
plot(t, rotation);
legend('phix', 'phiy', 'phiz');
title('rotation in world coordinates');
axis([startTime stopTime, -pi/2, pi/2]);

%% plot estimated kinematics
figure;
mass = estimation(start:stop, 1);
mTimesC = estimation(start:stop, 2:4);
centerOfGravity = [mTimesC(:, 1)./mass mTimesC(:, 2)./mass mTimesC(:, 3)./mass];
inertia = estimation(start:stop, 5:10);
subplot(1, 3, 1);
plot(t, mass);
title('mass');
axis([startTime stopTime, 0, 5]);
subplot(1, 3, 2);
plot(t, centerOfGravity);
title('center of gravity');
legend('x', 'y', 'z');
axis([startTime stopTime, -0.2, 0.2]);
subplot(1, 3, 3);
plot(t, inertia);
title('inertia');
legend('I_{xx}', 'I_{yy}', 'I_{zz}', 'I_{xy}', 'I_{xz}', 'I_{yz}');
axis([startTime stopTime, -0.2, 0.2]);

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
axis([startTime stopTime, 0, 2.5]);
subplot(2, 2, 3);
plot(t, positionPerfectFiltered);
title('position perfect filtered');
axis([startTime stopTime, 0, 2.5]);
subplot(2, 2, 4);
plot(t(1:end-1), velocityPerfectFiltered);
title('velocity perfect filtered');
axis([startTime stopTime, -0.2, 0.2]);
subplot(2, 2, 2);
plot(t, velFilt(start:stop, :));
title('velocity filtered');
axis([startTime stopTime, -0.2, 0.2]);

figure;
plot(t, accFilt(start:stop,:));
title('acceleration filtered');
legend('x', 'y', 'z');
axis([startTime stopTime, -1, 1]);

%% plot set and measured values
rotation = objectRotWC(start:stop,:);
dw = [diff(rotation(:, 1)), diff(rotation(:, 2)), diff(rotation(:, 3))];
dt = diff(t)';
angularVelocity = [dw(:, 1)./dt, dw(:, 2)./dt, dw(:, 3)./dt];
angularVelocitySet = [-actContCmd(start:stop,6),actContCmd(start:stop,5),actContCmd(start:stop,7)];

figure;
subplot(3, 1, 1);
plot(t(1:end-1), angularVelocity(:,1));
hold on
plot(t, angularVelocitySet(:,1));
axis([startTime stopTime -0.5 0.5]);


subplot(3, 1, 2);
plot(t(1:end-1), angularVelocity(:,2));
hold on
plot(t, angularVelocitySet(:,2));
axis([startTime stopTime -0.5 0.5]);

subplot(3, 1, 3);
plot(t(1:end-1), angularVelocity(:,3));
hold on
plot(t, angularVelocitySet(:,3));
axis([startTime stopTime -0.5 0.5]);

title('angular velocity, measured and filtered x-y-z');
figure
subplot(4,1,1)
plot(t,EEFForSens(start:stop,:));
subplot(4,1,2)
plot(t,HLForSens(start:stop,:));
subplot(4,1,3)
plot(t,HRForSens(start:stop,:));
subplot(4,1,4)
FSum = EEFForSens(start:stop,:)+HLForSens(start:stop,:)+HRForSens(start:stop,:);

Norm = sqrt(sum(abs(FSum).^2,2));
plot(t,Norm./norm(g));