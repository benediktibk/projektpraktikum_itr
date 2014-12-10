%% initialization
Ts = 0.01;
x = 0.077;
y = 0.06;
z = 0.04;
c = [0.025 0.05 0]';
m = 1.4;

I_xx = 1/12*m*(y^2 + z^2);
I_yy = 1/12*m*(x^2 + z^2);
I_zz = 1/12*m*(y^2 + x^2);
I_cog = diag([I_xx I_yy I_zz]);
I_grasp = I_cog + m*((c'*c)*eye(3) - c*c');
I = [diag(I_grasp); I_grasp(1, 2); I_grasp(1, 3); I_grasp(2, 3)];

start = 2193;
stop = 4357;

close all;
estimationSlow = load('one_grasping_point_multiple_movements/estimation.dat');

%% plots
figure;
subplot(2, 1, 1);
plotEstimationError(estimation(:, 1), m, start, stop, Ts);
ylim([-0.3 0.3]);
xlim([0 7]);
ylabel('yaxism')
set(gca,'YTick',-0.3:0.15:0.3)
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{})
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
legend('merror');
subplot(2, 1, 2);
plotEstimationError(estimation(:, 2:4)/m, c, start, stop, Ts);
ylim([-0.2 0.2]);
xlim([0 7]);
xlabel('xaxis')
ylabel('yaxisc')
set(gca,'YTick',-0.2:0.1:0.2)
set(gca,'YTickLabel',{'illllllll','illllllli','illllllil','illllllii','illlllill'})
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev', 'eig'})
legend('cerror1', 'cerror2', 'cerror3', 'Location', 'southeast');
print(gcf,'../figures/one_grasping_point_multiple_movements_mass_and_cog','-depsc');
figure;
plotEstimationError(estimation(:, 5:10), I, start, stop, Ts);
ylim([-0.02 0.02]);
xlim([0 7]);
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-0.02:0.01:0.02)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',0:1:7)
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six', 'sev', 'eig'})
legend('Ixxerror', 'Iyyerror', 'Izzerror', 'Ixyerror', 'Ixzerror', 'Iyzerror');
print(gcf,'../figures/one_grasping_point_multiple_movements_inertias','-depsc');