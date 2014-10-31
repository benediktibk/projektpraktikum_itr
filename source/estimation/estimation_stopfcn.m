%% Visualization
close all
clearvars -EXCEPT p theta_hat c
clc

figure(1)
plot3(p(:,1),p(:,2),p(:,3))
hold on
q = p +repmat(c',size(p,1),1);
plot3(q(:,1),q(:,2),q(:,3),'r')
for i = 1:100:size(p,1)
    plot3([p(i,1),q(i,1)],[p(i,2),q(i,2)],[p(i,3),q(i,3)],'g--');
end
plot3([0 1],[0 0],[0 0],'k','Linewidth',3)
plot3([0 0],[0 1],[0 0],'k','Linewidth',3)
plot3([0 0],[0 0],[0 1],'k','Linewidth',3)
axis equal
grid on
xlabel('x')
ylabel('y')
zlabel('z')
legend('p','q')

figure(2)
plot(theta_hat.time,theta_hat.signals.values)
ylim([-15,15])
legend('m','mc_x','mc_y','mc_z','I_{p,xx}','I_{p,xy}','I_{p,xz}','I_{p,yy}','I_{p,yz}','I_{p,zz}')