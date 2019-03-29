function [ mu, sigma ] = Gaussian1D( x )
% Computes the mean and variance parameters for a
% set of samples assumed to be normally distributed.

    size_x = length(x);
    
    mu = (1 / size_x) * sum(x);
    
    sigma = ( (1 / size_x) * sum((x - mu).^2) ) * ( size_x / (size_x - 1) );
    sigma = sqrt( sigma );

end

