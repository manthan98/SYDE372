function [ lambda ] = Exponential1D( x )
% Computes the lambda parameter for a
% set of samples assumed to be exponentially distributed.

    size_x = length(x);
    
    lower_sum = 0;
    for i = 1:size_x
        lower_sum = lower_sum + x(i);
    end
    
    lambda = size_x / lower_sum;

end

