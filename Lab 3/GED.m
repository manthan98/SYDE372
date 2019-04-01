function [ points ] = GED( X, Y, mu_A, sigma_A, mu_B, sigma_B, mu_C, sigma_C )
% Generates a GED (Generalized Euclidean Distance) decision boundary
% between classes in the form of an output matrix

    if nargin < 8
        
        % Two class case
        
        points = zeros(size(X, 1), size(Y, 2));

        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                points(i, j) = GED_util([X(i, j) Y(i, j)]);
            end
        end
        
    else
        
        % Three class case
        
        points = zeros(size(X, 1), size(Y, 2));
    
        a = 1;
        b = 2;
        c = 3;
    
        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                point = [X(i, j) Y(i, j)];

                ged_A = sqrt( (point - mu_A) * (inv(sigma_A)) * (point - mu_A)' );
                ged_B = sqrt( (point - mu_B) * (inv(sigma_B)) * (point - mu_B)' );
                ged_C = sqrt( (point - mu_C) * (inv(sigma_C)) * (point - mu_C)' );

                if ged_A < ged_B && ged_A < ged_C
                    points(i, j) = a;
                elseif ged_B < ged_A && ged_B < ged_C
                    points(i, j) = b;
                else
                    points(i, j) = c;
                end
            end
        end

    end
    
    % Utility function that implements MED equation
    function y = GED_util(point)
        y = sqrt( ( (point - mu_A) * (inv(sigma_A)) * (point - mu_A)' ) ) - sqrt( ( (point - mu_B) * (inv(sigma_B)) * (point - mu_B)' ) );
    end

end