%% initialization
Ts = 0.01;
c = [-0.185 0.22 0]';
m = 4.3545;

startRobot = 2683;
stopRobot = 4963;
startHuman = 3822;
stopHuman = 6592;

close all;
estimationRobot = load('multiple_grasping_points_robot/estimation.dat');
estimationHuman = load('multiple_grasping_points_human/estimation.dat');

%% robot
figure;
subplot(2, 1, 1);
plotValues(estimationRobot(:, 1), startRobot, stopRobot, Ts);
ylim([3 6]);
xlim([0 22]);
ylabel('yaxism')
set(gca,'YTick',3:1:6)
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
legend('mest');
subplot(2, 1, 2);
plotValues(estimationRobot(:, 2:4)/m, startRobot, stopRobot, Ts);
ylim([-0.4 0.4]);
xlim([0 22]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.4:0.2:0.4)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv'})
legend('cx', 'cy', 'cz', 'Location', 'southeast');
print(gcf,'../figures/multiple_grasping_points_robot_mass_and_cog','-depsc' );
figure;
plotValues(estimationRobot(:, 5:10), startRobot, stopRobot, Ts);
ylim([-0.1 0.1]);
xlim([0 22]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.1:0.05:0.1)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
legend('Ixx', 'Iyy', 'Izz', 'Ixy', 'Ixz', 'Iyz');
print(gcf,'../figures/multiple_grasping_points_robot_inertias','-depsc' );

%% robot
figure;
subplot(2, 1, 1);
plotValues(estimationHuman(:, 1), startHuman, stopHuman, Ts);
ylim([3 6]);
xlim([0 27]);
ylabel('yaxism')
set(gca,'YTick',3:1:6)
set(gca,'XTick',0:5:22)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
legend('mest');
subplot(2, 1, 2);
plotValues(estimationHuman(:, 2:4)/m, startHuman, stopHuman, Ts);
ylim([-0.4 0.4]);
xlim([0 27]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.4:0.2:0.4)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:5:25)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
legend('cx', 'cy', 'cz', 'Location', 'southeast');
print(gcf,'../figures/multiple_grasping_points_robot_mass_and_cog','-depsc' );
figure;
plotValues(estimationHuman(:, 5:10), startHuman, stopHuman, Ts);
ylim([-0.1 0.1]);
xlim([0 27]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.1:0.05:0.1)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:5:25)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
legend('Ixx', 'Iyy', 'Izz', 'Ixy', 'Ixz', 'Iyz');
print(gcf,'../figures/multiple_grasping_points_robot_inertias','-depsc' );