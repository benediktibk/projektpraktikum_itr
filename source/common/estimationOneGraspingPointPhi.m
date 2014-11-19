function Phi = estimationOneGraspingPointPhi(inputs)
    ddp = inputs(1:3);
    omega = inputs(4:6);
    domega = inputs(7:9);
    g = inputs(10:12);
    omegaCross = crossMatrix(omega);
    domegaCross = crossMatrix(domega);
    omegaDot = dotMatrix(omega);
    domegaDot = dotMatrix(domega);
    Phi = [ddp+g , domegaCross+omegaCross*omegaCross, zeros(3,6) ; zeros(3,1) , crossMatrix(-g-ddp) , domegaDot+omegaCross*omegaDot];
end