function thetaHat = estimationOneGraspingPoint(F, N, omega, domega, ddp, g, forgettingFactor, reinitialize)
    h = [F;N];
    Phi = estimationOneGraspingPointPhi(omega, domega, ddp, g);
    thetaHat = recursiveLeastSquares(h, Phi, forgettingFactor, reinitialize);
end