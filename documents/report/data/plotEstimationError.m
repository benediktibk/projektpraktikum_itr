function [] = plotEstimationError(estimation, correctValue, start, stop, Ts)
    length = stop - start + 1;
    t = start:stop;
    estimatedValues = estimation(t, :);
    error = estimatedValues - ones(length, 1)*correctValue';
    plot((t - start)*Ts, error);
end

