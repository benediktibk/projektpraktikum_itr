function [ conditionDistance ] = calculateConditionDistance(A, Ainv)
    condition = norm(A)*norm(Ainv);
    
    if (condition > 1)
        conditionDistance = condition;
    else
        conditionDistance = 1/condition;
    end
end

