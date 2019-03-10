function [ lambda ] = Exponential1D( x )
% Computes the lambda parameter for a
% set of samples assumed to be exponentially distributed.

    lambda = length(x) / sum(x);

end

