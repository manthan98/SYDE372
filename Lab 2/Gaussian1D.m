function [ mu, sigma ] = Gaussian1D( x )
% Computes the mean and variance parameters for a
% set of samples assumed to be normally distributed.

    size_x = length(x);
    mu = 0;
    sigma = 0;
    
    for i = 1:size_x
        mu = mu + x(i);
    end
    mu = (1 / size_x) * mu;
    
    for i = 1:size_x
        sigma = sigma + (x(i) - mu)^2;
    end
    sigma = (1 / size_x) * sigma;
    sigma = sqrt( ( size_x / (size_x - 1) ) * sigma );

end

