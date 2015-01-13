%% initialization
close all;

estimation_initfcn
startTime = 0.01;
endTime = 5;
t = startTime:Ts:endTime;
startIndex = int64(startTime/Ts) + 1;
endIndex = int64(endTime/Ts) + 1;

%% forces with and without noise
forceReduced = force(startIndex:endIndex, 2:4);
forceNoisyReduced = forceNoisy(startIndex:endIndex, 2:4);
figure;

hold on;
plot(t,forceNoisyReduced(:,1));
plot(t,forceReduced(:,1),'r--','LineWidth',2);
axis([startTime endTime, -120, 120]);
hold off;
xlabel('xaxis')
ylabel('yaxis')
set(gca,'YTick',-100:50:100)
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii','llllllill'})
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})

set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../../documents/report/figures/forces','-depsc' );

%% estimation one grasping point without noise
mErrorReduced = abs(mError(startIndex:endIndex, 2));
cErrorReduced = abs(cError(startIndex:endIndex, 2:4)/m);
inertiaErrorReduced = abs(inertiaError(startIndex:endIndex, 2:7));
figure;
subplot(2,1,1)
semilogy(t, mErrorReduced);

set(gca,'YTick',[10^-6 10^-4 10^-2 10^0])
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
set(gca,'XTickLabel',{})
ylabel('y1')

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
subplot(2,1,2)
semilogy(t, cErrorReduced);
legend('cerror1', 'cerror2', 'cerror3');

set(gca,'YTick',[10^-10 10^-5 10^0])
set(gca,'YTickLabel',{'llllllill','llllllili','lllllliil'})

set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
xlabel('x')

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
ylabel('y2')
ylim([10^-10 10^0])
print(gcf,'../../documents/report/figures/mass','-depsc' );

figure;
semilogy(t, inertiaErrorReduced);
legend('Ierror1', 'Ierror2','Ierror3','Ierror4','Ierror5','Ierror6');

xlabel('xaxis')
ylabel('yaxis')
ylim([10^-10 10^2])
set(gca,'YTick',[10.^(-10:2:2)])
set(gca,'YTickLabel',{'lllllllll','','lllllllli','','lllllllil','','lllllllii'})
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.2 0 0])

set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../../documents/report/figures/inertia','-depsc' );

%% estimation one grasping point with noise
mErrorReduced = abs(mErrorNoise(startIndex:endIndex, 2));
cErrorReduced = abs(cErrorNoise(startIndex:endIndex, 2:4)/m);
inertiaErrorReduced = abs(inertiaErrorNoise(startIndex:endIndex, 2:7));
figure;
subplot(2,1,1)
semilogy(t, mErrorReduced);

set(gca,'YTick',[10^-6 10^-4 10^-2 10^0])
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
set(gca,'XTickLabel',{})
ylabel('y1')
ylim([10^-5 10^0])

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
subplot(2,1,2)
semilogy(t, cErrorReduced);
legend('cerror1', 'cerror2', 'cerror3');

set(gca,'YTick',[10^-6 10^-2 10^2])
set(gca,'YTickLabel',{'llllllill','llllllili','lllllliil'})

set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
xlabel('x')

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
ylabel('y2')
ylim([10^-7 10^2])
print(gcf,'../../documents/report/figures/mass_noise','-depsc' );

figure;
semilogy(t, inertiaErrorReduced);
legend('Ierror1', 'Ierror2','Ierror3','Ierror4','Ierror5','Ierror6');

xlabel('xaxis')
ylabel('yaxis')
ylim([10^-6 10^2])
set(gca,'YTick',[10.^(-6:2:2)])
set(gca,'YTickLabel',{'lllllllll','','lllllllli','','lllllllil'})
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.2 0 0])

set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../../documents/report/figures/inertia_noise','-depsc' );

%% estimation three grasping points without noise
mErrorReduced = abs(mErrorMulti(startIndex:endIndex, 2));
cErrorReduced = abs(cErrorMulti(startIndex:endIndex, 2:4)/m);
inertiaErrorReduced = abs(inertiaErrorMulti(startIndex:endIndex, 2:7));
figure;
subplot(2,1,1)
semilogy(t, mErrorReduced);

set(gca,'YTick',[10^-6 10^-4 10^-2 10^0])
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
set(gca,'XTickLabel',{})
ylabel('y1')

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
subplot(2,1,2)
semilogy(t, cErrorReduced);
legend('cerror1', 'cerror2', 'cerror3');

set(gca,'YTick',[10^-10 10^-5 10^0])
set(gca,'YTickLabel',{'llllllill','llllllili','lllllliil'})

set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
xlabel('x')

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
ylabel('y2')
ylim([10^-10 10^0])
print(gcf,'../../documents/report/figures/mass_multi','-depsc' );

figure;
semilogy(t, inertiaErrorReduced);
legend('Ierror1', 'Ierror2','Ierror3','Ierror4','Ierror5','Ierror6');

xlabel('xaxis')
ylabel('yaxis')
ylim([10^-10 10^2])
set(gca,'YTick',[10.^(-10:2:2)])
set(gca,'YTickLabel',{'lllllllll','','lllllllli','','lllllllil','','lllllllii'})
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.2 0 0])

set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../../documents/report/figures/inertia_multi','-depsc' );

%% estimation three grasping points with noise
mErrorReduced = abs(mErrorMultiNoise(startIndex:endIndex, 2));
cErrorReduced = abs(cErrorMultiNoise(startIndex:endIndex, 2:4)/m);
inertiaErrorReduced = abs(inertiaErrorMultiNoise(startIndex:endIndex, 2:7));
figure;
subplot(2,1,1)
semilogy(t, mErrorReduced);

set(gca,'YTick',[10^-6 10^-4 10^-2 10^0])
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'YTickLabel',{'lllllllll','lllllllli','lllllllil','lllllllii'})
set(gca,'XTickLabel',{})
ylabel('y1')
ylim([10^-6 10^0])

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
subplot(2,1,2)
semilogy(t, cErrorReduced);
legend('cerror1', 'cerror2', 'cerror3');

set(gca,'YTick',[10^-6 10^-2 10^2])
set(gca,'YTickLabel',{'llllllill','llllllili','lllllliil'})

set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})
xlabel('x')

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.1 0 0])
ylabel('y2')
ylim([10^-6 10^2])
set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../../documents/report/figures/mass_multi_noise','-depsc' );

figure;
semilogy(t, inertiaErrorReduced);
legend('Ierror1', 'Ierror2','Ierror3','Ierror4','Ierror5','Ierror6');

xlabel('xaxis')
ylabel('yaxis')
ylim([10^-6 10^2])
set(gca,'YTick',[10.^(-6:2:2)])
set(gca,'YTickLabel',{'lllllllll','','lllllllli','','lllllllil'})
set(gca,'XTick',[startTime, 1:1:endTime])
set(gca,'XTickLabel',{'one','two','thr','fou','fiv','six'})

ylabh = get(gca,'YLabel');
set(ylabh,'Position',get(ylabh,'Position') - [0.2 0 0])

set(gcf,'Position',[400 100 600 300])
set(gcf, 'PaperPositionMode', 'auto');
box on
print(gcf,'../../documents/report/figures/inertia_multi_noise','-depsc' );
