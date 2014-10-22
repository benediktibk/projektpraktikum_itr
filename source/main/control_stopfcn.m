

if(exist(['~/ppData/',date],'dir') == 0)
    mkdir(['~/ppData/',date]);
end

i= 1;
while(exist(['~/ppData/',date,'/Measurement_',num2str(i)],'dir') ~= 0)
    i = i+1;
end
mkdir(['~/ppData/',date,'/Measurement_',num2str(i)]);   
!scp robot1Platform:pp_ident/workspace/*.dat ./
copyfile('Data_Analysis.m',['~/ppData/',date,'/Measurement_',num2str(i)])
copyfile('*.dat',['~/ppData/',date,'/Measurement_',num2str(i)])
copyfile('control_initfcn.m',['~/ppData/',date,'/Measurement_',num2str(i)])
copyfile('control.slx',['~/ppData/',date,'/Measurement_',num2str(i)])

delete('*.dat')
delete('*.mat')

%cd(['Data/',date,'/Measurement_',num2str(i)])
clc
close all

