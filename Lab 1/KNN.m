function [ points ] = KNN( X, Y, k, A, B, C )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 6
        points = zeros(size(X, 1), size(Y, 2));
        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                val = [X(i, j) Y(i, j)];
                prototype_A = calculatePrototype(val, A, k);
                prototype_B = calculatePrototype(val, B, k);
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
                prototype_A = calculatePrototype(val, A, k);
                prototype_B = calculatePrototype(val, B, k);
                prototype_C = calculatePrototype(val, C, k);
                
                dist_A = sqrt( (val - prototype_A) * (val - prototype_A)' );
                dist_B = sqrt( (val - prototype_B) * (val - prototype_B)' );
                dist_C = sqrt( (val - prototype_C) * (val - prototype_C)' );

                if dist_A < dist_B && dist_A < dist_C
                    points(i, j) = a;
                elseif dist_B < dist_A && dist_B < dist_C
                    points(i, j) = b;
                elseif dist_C < dist_A && dist_C < dist_B
                    points(i, j) = c;
                end
            end
        end
    end
    
    function prototype = calculatePrototype(point, samples, k)
        distances = zeros(size(samples,1), 3);        
        for row = 1:size(samples, 1)
            dist = sqrt( (point - samples(row,:)) * (point - samples(row,:))' );
            distances(row,:) = [samples(row,1), samples(row,2), dist];
        end  
        distances = sortrows(distances, 3);
        x = 0;
        y = 0;
        for f = 1:k
            x = x + distances(f,1);
            y = y + distances(f,2);
        end
        x = x / k;
        y = y / k;
        prototype = [x,y];
    end
end
