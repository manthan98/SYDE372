function [ points ] = MED( X, Y, mu_A, mu_B, mu_C )
% Generates a MED (Minimum Euclidean Distance) decision boundary
% between two classes in the form of an output matrix

if nargin < 5
    
    % Generate matrix of zeros defined by number of rows
    % in X and number of columns in Y (e.g. X x Y)
    points = zeros(size(X, 1), size(Y, 2));

    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            val = [X(i, j) Y(i, j)];
            points(i, j) = ( (val - mu_A) * (val - mu_A)' ) - ( (val - mu_B) * (val - mu_B)' );
        end
    end
    
else
    
    points = zeros(size(X, 1), size(Y, 2));
    
    a = 1;
    b = 2;
    c = 3;
    
    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            point = [X(i, j) Y(i, j)];
            
            med_A = sqrt( (point - mu_A) * (point - mu_A)' );
            med_B = sqrt( (point - mu_B) * (point - mu_B)' );
            med_C = sqrt( (point - mu_C) * (point - mu_C)' );
            
            if med_A < med_B && med_A < med_C
                points(i, j) = a;
            elseif med_B < med_A && med_B < med_C
                points(i, j) = b;
            else
                points(i, j) = c;
            end
        end
    end
    
end

end

