function [ mu, sigma ] = Gaussian1D( x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    size_x = size(x, 2);
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

