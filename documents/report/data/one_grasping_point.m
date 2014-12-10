%% initialization
Ts = 0.01;
x = 0.077;
y = 0.06;
z = 0.04;
c = [0 0.05 0]';
m = 1.4;

I_xx = 1/12*m*(y^2 + z^2);
I_yy = 1/12*m*(x^2 + z^2);
I_zz = 1/12*m*(y^2 + x^2);
I_cog = diag([I_xx I_yy I_zz]);
I_grasp = I_cog + m*((c'*c)*eye(3) - c*c');
I = [diag(I_grasp); I_grasp(1, 2); I_grasp(1, 3); I_grasp(2, 3)];

startSlow = 2110;
stopSlow = 5089;
startNoMovement = 3334;
stopNoMovement = 4065;
startFast = 1636;
stopFast = 4912;

close all;
estimationSlow = load('one_grasping_point_slow/estimation.dat');
estimationNoMovement = load('one_grasping_point_no_movement/estimation.dat');
estimationFast = load('one_grasping_point_fast/estimation.dat');

%% slow movement
figure;
subplot(2, 1, 1);
plotEstimationError(estimationSlow(:, 1), m, startSlow, stopSlow, Ts);
ylim([-0.15 0.15]);
xlim([0 30]);
ylabel('yaxism')
set(gca,'YTick',-0.1:0.1:0.1)
set(gca,'XTick',0:5:30)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil'})
legend('merror');
subplot(2, 1, 2);
plotEstimationError(estimationSlow(:, 2:4)/m, c, startSlow, stopSlow, Ts);
ylim([-0.1 0.1]);
xlim([0 30]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.1:0.05:0.1)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:5:30)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev'})
legend('cerror1', 'cerror2', 'cerror3', 'Location', 'southeast');
print(gcf,'../figures/one_grasping_point_slow_mass_and_cog','-depsc' );
figure;
plotEstimationError(estimationSlow(:, 5:10), I, startSlow, stopSlow, Ts);
ylim([-0.01 0.01]);
xlim([0 30]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.01:0.005:0.01)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:5:30)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev'})
legend('Ixxerror', 'Iyyerror', 'Izzerror', 'Ixyerror', 'Ixzerror', 'Iyzerror');
print(gcf,'../figures/one_grasping_point_slow_inertias','-depsc' );

%% no movement
figure;
subplot(2, 1, 1);
plotEstimationError(estimationNoMovement(:, 1), m, startNoMovement, stopNoMovement, Ts);
ylim([-0.3 0.3]);
xlim([0 7]);
ylabel('yaxism')
set(gca,'YTick',-0.3:0.15:0.3)
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
legend('merror');
subplot(2, 1, 2);
plotEstimationError(estimationNoMovement(:, 2:4)/m, c, startNoMovement, stopNoMovement, Ts);
ylim([-0.2 0.2]);
xlim([0 7]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.2:0.1:0.2)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev', 'eig'})
legend('cerror1', 'cerror2', 'cerror3', 'Location', 'southeast');
print(gcf,'../figures/one_grasping_point_no_movement_mass_and_cog','-depsc');
figure;
plotEstimationError(estimationNoMovement(:, 5:10), I, startNoMovement, stopNoMovement, Ts);
ylim([-0.1 0.1]);
xlim([0 7]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.1:0.05:0.1)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev', 'eig'})
legend('Ixxerror', 'Iyyerror', 'Izzerror', 'Ixyerror', 'Ixzerror', 'Iyzerror');
print(gcf,'../figures/one_grasping_point_no_movement_inertias','-depsc');

%% fast movement
figure;
subplot(2, 1, 1);
plotEstimationError(estimationFast(:, 1), m, startFast, stopFast, Ts);
ylim([-0.3 0.3]);
xlim([0 7]);
ylabel('yaxism')
set(gca,'YTick',-0.3:0.15:0.3)
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
legend('merror');
subplot(2, 1, 2);
plotEstimationError(estimationFast(:, 2:4)/m, c, startFast, stopFast, Ts);
ylim([-0.2 0.2]);
xlim([0 7]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.2:0.1:0.2)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev', 'eig'})
legend('cerror1', 'cerror2', 'cerror3', 'Location', 'southeast');
print(gcf,'../figures/one_grasping_point_fast_mass_and_cog','-depsc');
figure;
plotEstimationError(estimationFast(:, 5:10), I, startFast, stopFast, Ts);
ylim([-0.02 0.02]);
xlim([0 7]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.02:0.01:0.02)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev', 'eig'})
legend('Ixxerror', 'Iyyerror', 'Izzerror', 'Ixyerror', 'Ixzerror', 'Iyzerror');
print(gcf,'../figures/one_grasping_point_fast_inertias','-depsc');