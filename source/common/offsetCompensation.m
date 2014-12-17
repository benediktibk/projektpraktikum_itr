function [Force_Out, Torque_Out, State] = offsetCompensation(trigger,Force,Torque)
    persistent i previousTrigger currentState forceOffset torqueOffset;

    if isempty(i)
        i = 0;
    end
    if isempty(currentState)
        currentState = 0;
        % State 0 : output = input
        % State 1 : output = input && calculate 100 bin average
        % State 2 : output = input - offset
    end
    if isempty(previousTrigger)
        previousTrigger = 0;
    end
    if isempty(forceOffset)
        forceOffset = zeros(3, 1);
    end
    if isempty(torqueOffset)
        torqueOffset = zeros(3, 1);
    end
    
    
    %% Falling Edge
    if (previousTrigger==1 && trigger==0)
        currentState = 2;
    end
    %% Rising Edge
    if (previousTrigger==0 && trigger==1)
        currentState = 1;
        i = 0;
        forceOffset = 0;
        torqueOffset = 0;
    end
    
    if currentState == 1
        Force_Out = Force;
        Torque_Out = Torque;
        
        forceOffset = forceOffset + Force;
        torqueOffset = torqueOffset + Torque;
        i = i+1;
        
    elseif currentState == 2
        Force_Out = Force - forceOffset/i;
        Torque_Out = Torque - torqueOffset/i;
    else
        Force_Out = Force;
        Torque_Out = Torque;
    end
    previousTrigger = trigger;
    State = currentState;
end


end

