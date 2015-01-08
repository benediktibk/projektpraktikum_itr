function [] = plotValues(values, start, stop, Ts)
    t = start:stop;
    valuesReduced = values(t, :);
    plot((t - start)*Ts, valuesReduced);
end

