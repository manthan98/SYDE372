function [a, b] = Uniform1D(x)
    %ML estimate for a set of samples assumed to be uniformly distributed
    a = min(x);
    b = max(x);
end

