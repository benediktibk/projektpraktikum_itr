function Phi = estimationOneGraspingPointPhi(omega, domega, ddp, g)
    omegaCross = crossMatrix(omega);
    domegaCross = crossMatrix(domega);
    omegaDot = dotMatrix(omega);
    domegaDot = dotMatrix(domega);
    Phi = [ddp+g , domegaCross+omegaCross*omegaCross, zeros(3,6) ; zeros(3,1) , crossMatrix(-g-ddp) , domegaDot+omegaCross*omegaDot];
end