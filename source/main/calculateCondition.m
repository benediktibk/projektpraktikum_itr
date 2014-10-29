function [ condition ] = calculateCondition(A, Ainv)
    condition = norm(A)*norm(Ainv);
end

