function [ points ] = GED( mu_A, mu_B, sigma_A, sigma_B, X, Y )
% Generates a GED (Generalized Euclidean Distance) decision boundary
% between two classes in the form of an output matrix

    points = zeros(size(X, 1), size(Y, 2));
    
    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            points(i, j) = GED_util([X(i, j) Y(i, j)]);
        end
    end
    
    function y = GED_util(point)
        y = sqrt( ( (point - mu_A) * inv(sigma_A) * (point - mu_A)' ) ) - sqrt( ( (point - mu_B) * inv(sigma_B) * (point - mu_B)' ) );
    end

end

