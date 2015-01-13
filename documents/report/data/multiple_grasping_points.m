%% initialization
Ts = 0.01;
c = [-0.185 0.22 0]';
m = 4.3545;

startRobot = 2683;
stopRobot = 4963;
lengthRobot = stopRobot - startRobot + 1;
startHuman = 3822;
stopHuman = 6592;
lengthHuman = stopHuman - startHuman + 1;

close all;
estimationRobot = load('multiple_grasping_points_robot/estimation.dat');
estimationHuman = load('multiple_grasping_points_human/estimation.dat');

%% robot
%Mass Com

figure;
t = Ts*(0:(stopRobot - startRobot));
subplot(2, 1, 1);
hold on;
plot(t, estimationRobot(startRobot:stopRobot, 1));
plot(t, ones(lengthRobot, 1)*m, '--');
hold off;
ylim([3 6]);
xlim([0 22]);
ylabel('yaxism')
set(gca,'YTick',3:1:6)
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
box on
subplot(2, 1, 2);
hold on;
plot(t, estimationRobot(startRobot:stopRobot, 2:4)/m);
plot(t, bsxfun(@times, ones(3, lengthRobot), c), '--');
hold off;
ylim([-0.4 0.4]);
xlim([0 22]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.4:0.2:0.4)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv'})
legend('cx', 'cy', 'cz', 'Location', 'southeast');
box on
print(gcf,'../figures/multiple_grasping_points_robot_mass_and_cog','-depsc' );

%Inertias
figure;
hold on;
plot(t, estimationRobot(startRobot:stopRobot, 5:10));
hold off;
ylim([-0.1 0.1]);
xlim([0 22]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.1:0.05:0.1)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
legend('Ixx', 'Iyy', 'Izz', 'Ixy', 'Ixz', 'Iyz');
set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../figures/multiple_grasping_points_robot_inertias','-depsc' );

%% human

% Mass Com
figure;
t = Ts*(0:(stopHuman - startHuman));
subplot(2, 1, 1);
hold on;
plot(t, estimationHuman(startHuman:stopHuman, 1));
plot(t, ones(lengthHuman, 1)*m, '--');
hold off;
ylim([3 6]);
xlim([0 27]);
ylabel('yaxism')
set(gca,'YTick',3:1:6)
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
box on
subplot(2, 1, 2);
hold on;
plot(t, estimationHuman(startHuman:stopHuman, 2:4)/m);
plot(t, bsxfun(@times, ones(3, lengthHuman), c), '--');
hold off;
ylim([-0.4 0.4]);
xlim([0 27]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.4:0.2:0.4)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:5:25)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
legend('cx', 'cy', 'cz', 'Location', 'southeast');
box on
print(gcf,'../figures/multiple_grasping_points_human_mass_and_cog','-depsc' );

% Inertia
figure;
hold on;
plot(t, estimationHuman(startHuman:stopHuman, 5:10));
hold off;
ylim([-0.1 0.1]);
xlim([0 27]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.1:0.05:0.1)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:5:25)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
legend('Ixx', 'Iyy', 'Izz', 'Ixy', 'Ixz', 'Iyz');
set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../figures/multiple_grasping_points_human_inertias','-depsc' );