function [ points ] = NN( X, Y, A, B, C)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 5
        points = zeros(size(X, 1), size(Y, 2));
        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                val = [X(i, j) Y(i, j)];
                prototype_A = calculatePrototype(val, A);
                prototype_B = calculatePrototype(val, B);
                points(i, j) = ( (val - prototype_A) * (val - prototype_A)' ) - ( (val - prototype_B) * (val - prototype_B)' );
            end
        end
    else
        points = zeros(size(X, 1), size(Y, 2));
        
        a = 1;
        b = 2;
        c = 3;
        
        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                val = [X(i, j) Y(i, j)];
                prototype_A = calculatePrototype(val, A);
                prototype_B = calculatePrototype(val, B);
                prototype_C = calculatePrototype(val, C);
                
                dist_A = sqrt( (val - prototype_A) * (val - prototype_A)' );
                dist_B = sqrt( (val - prototype_B) * (val - prototype_B)' );
                dist_C = sqrt( (val - prototype_C) * (val - prototype_C)' );

                if dist_A < dist_B && dist_A < dist_C
                    points(i, j) = a;
                elseif dist_B < dist_A && dist_B < dist_C
                    points(i, j) = b;
                else
                    points(i, j) = c;
                end
            end
        end
    end
    
    function prototype = calculatePrototype(point, samples)
        for row = 1:size(samples, 1)
            if row == 1
                minDistance = sqrt((point - samples(row,:)) * (point - samples(row,:))' );
                prototype = samples(row,:);
            else
                dist = sqrt( (point - samples(row,:)) * (point - samples(row,:))' );
                if dist < minDistance
                    minDistance = dist; 
                    prototype = samples(row,:);
                end
            end
        end
    end
end

