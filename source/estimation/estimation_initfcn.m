addpath('functions/');

%% Sampling Time Ts 
Ts = 0.001;

%% Object Properties
m = 2; % mass
x = 0.5;
y = 0.1;
z = 0.03;
c = [x y z]'; % Grasping Offset
I_xx = 1/12*m*(y^2+z^2);
I_yy = 1/12*m*(x^2+z^2);
I_zz = 1/12*m*(y^2+x^2);
I_q  = diag([I_xx,I_yy,I_zz]); % inertia in center of gravity
I_p = (I_q+m*(c'*c*eye(3)-c*c'))'; % inertia in grasping point

