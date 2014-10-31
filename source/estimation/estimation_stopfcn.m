%% Visualization
close all
clearvars -EXCEPT p theta_hat c
clc
plot3(p(:,1),p(:,2),p(:,3))
hold on
q = p +repmat(c',size(p,1),1);
plot3(q(:,1),q(:,2),q(:,3),'r')

