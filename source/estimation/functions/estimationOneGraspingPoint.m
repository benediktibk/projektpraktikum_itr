function thetaHat = estimationOneGraspingPoint(F,N,omega,domega,ddp,g,forgettingFactor)
    persistent thetaHatPrevious PPrevious initializationNecessary;

    if isempty(initializationNecessary)
        initializationNecessary = 1;
    end

    % calculate linear relation Phi between the estimates and the input
    omegaCross = crossMatrix(omega);
    domegaCross = crossMatrix(domega);
    omegaDot = dotMatrix(omega);
    domegaDot = dotMatrix(domega);
    h = [F;N];
    Phi = [ddp+g , domegaCross+omegaCross*omegaCross, zeros(3,6) ; zeros(3,1) , crossMatrix(-g-ddp) , domegaDot+omegaCross*omegaDot];

    % intialize persisent variables
    if initializationNecessary == 1 || isempty(PPrevious)
        PPrevious = inv(Phi'*Phi);
        thetaHatPrevious = PPrevious*Phi'*h;
        thetaHat = thetaHatPrevious;
        initializationNecessary = 0;
        return;
    end    

    % check for invalid values in the current state
    if any(any(isnan(PPrevious)))
        initializationNecessary = 1;
        thetaHat = thetaHatPrevious;
        return;  
    end    

    KInternal = eye(6)+Phi*PPrevious*Phi';
    KInternalInv = inv(KInternal);

    % check for invalid values in the current estimation step
    if calculateConditionDistance(KInternal, KInternalInv) > 1e20
        initializationNecessary = 1;
        thetaHat = thetaHatPrevious;
        return;  
    end

    % calculate improved estimation
    K = PPrevious*Phi'*KInternalInv;
    PNew = (eye(10)-K*Phi)*PPrevious;
    P = (1 - forgettingFactor)*PNew + forgettingFactor*PPrevious;
    thetaHatNew = thetaHatPrevious+K*(h-Phi*thetaHatPrevious);
    thetaHat = (1 - forgettingFactor)*thetaHatNew + forgettingFactor*thetaHatPrevious;
    PPrevious = P;
    thetaHatPrevious = thetaHat;
end