function [thetaHat, F, N] = estimationThreeGraspingPoints(F1, F2, F3, N1, N2, N3, omega, domega, ddp, g, r12, r13, forgettingFactor, reinitialize)
    F = F1 + F2 + F3;
    N = N1 + N2 + N3 + cross(r12, F2) + cross(r13, F3);
    h = [F;N];
    Phi = estimationOneGraspingPointPhi(omega, domega, ddp, g);
    thetaHat = recursiveLeastSquares(h, Phi, forgettingFactor, reinitialize);
end