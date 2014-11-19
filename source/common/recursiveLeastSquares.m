function thetaHat = recursiveLeastSquares(measurements, Phi, forgettingFactor, reinitialize)
    persistent thetaHatPrevious PPrevious initializationNecessary;

    if isempty(initializationNecessary)
        initializationNecessary = 1;
    end
    
    if reinitialize == 1
        initializationNecessary = 1;
    end    

    % intialize persisent variables
    if initializationNecessary == 1 || isempty(PPrevious)
        PPrevious = inv(Phi'*Phi);
        thetaHatPrevious = PPrevious*Phi'*measurements;
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
    thetaHatNew = thetaHatPrevious+K*(measurements-Phi*thetaHatPrevious);
    thetaHat = (1 - forgettingFactor)*thetaHatNew + forgettingFactor*thetaHatPrevious;
    PPrevious = P;
    thetaHatPrevious = thetaHat;
end

