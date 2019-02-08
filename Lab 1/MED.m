function [ points ] = MED( mu_A, mu_B, X, Y )
% Generates a MED (Minimum Euclidean Distance) decision boundary
% between two classes in the form of an output matrix
    
    % Generate matrix of zeros defined by number of rows
    % in X and number of columns in Y (e.g. X x Y)
    points = zeros(size(X, 1), size(Y, 2));

    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            val = [X(i, j) Y(i, j)];
            points(i, j) = ( (val - mu_A) * (val - mu_A)' ) - ( (val - mu_B) * (val - mu_B)' );
        end
    end

end

