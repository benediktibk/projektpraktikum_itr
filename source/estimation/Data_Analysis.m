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
%print(gcf,'../../documents/report/figures/forces','-depsc' );



%% estimation one grasping point without noise
mErrorReduced = abs(mError(startIndex:endIndex, 2));
cErrorReduced = abs(cError(startIndex:endIndex, 2:4));
inertiaErrorReduced = abs(inertiaError(startIndex:endIndex, 2:7));
figure;
subplot(2,1,1)
semilogy(t, mErrorReduced);
legend('m error');
xlabel('t/[s]');
ylabel('m/[kg]');
subplot(2,1,2)
semilogy(t, cErrorReduced);
legend('c_x error', 'c_y error', 'c_z error');
xlabel('t/[s]');
ylabel('c error/[m]');
figure;
semilogy(t, inertiaErrorReduced);
legend('I_{xx} error', 'I_{yy} error', 'I_{zz} error', 'I_{xy} error', 'I_{xz} error', 'I_{yz} error');
xlabel('t/[s]');
ylabel('inertia error/[kg/m^2]');
box off