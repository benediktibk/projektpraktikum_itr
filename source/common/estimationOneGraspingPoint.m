function thetaHat = estimationOneGraspingPoint(F, N, omega, domega, ddp, g, forgettingFactor, reinitialize)
    h = [F;N];
    inputs = [ddp; omega; domega; g];
    thetaHat = recursiveLeastSquares(h, inputs, @estimationOneGraspingPointPhi, forgettingFactor, reinitialize);
end