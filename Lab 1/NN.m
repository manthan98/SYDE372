function [ points ] = NN( z_A, z_B, X, Y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    points = zeros(size(X, 1), size(Y, 2));
    
    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            point = [X(i, j), Y(i, j)];
            dist_A = closestPoint(point, z_A);
            dist_B = closestPoint(point, z_B);
            points(i, j) = dist_A - dist_B;
        end
    end
    
    function y = closestPoint(point, samples)
        y = -999;
        
        for k = 1:size(samples, 1)
            for l = 1:size(samples, 2)
                
                dist = sqrt( point.^2 + samples(k, l).^2 );
                
                if dist < y || y == -999
                    y = dist;
                end
                
            end
        end
        
    end

end

