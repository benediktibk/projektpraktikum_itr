%% Visualization
close all
clearvars -EXCEPT p theta_hat c
clc
plot3(p(:,1),p(:,2),p(:,3))
hold on
q = p +repmat(c',size(p,1),1);
plot3(q(:,1),q(:,2),q(:,3),'r')
for i = 1:100:size(p,1)
    line([p(i,1),q(i,1)],[p(i,2),q(i,2)],[p(i,3),q(i,3)]);
end