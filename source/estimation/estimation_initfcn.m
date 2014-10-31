addpath('functions/');

%% Sampling Time Ts 
Ts = 0.001;

%% Object Properties

m = 2 ;
x = 0.5;
y = 0.3;
z = 0.03;
I_xx = 1/12*m*(y^2+z^2);
I_yy = 1/12*m*(x^2+z^2);
I_zz = 1/12*m*(y^2+x^2);
I_q  = diag([I_xx,I_yy,I_zz]);