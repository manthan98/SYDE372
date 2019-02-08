function [ points ] = MAP( X, Y, mu_A, sigma_A, p_A, mu_B, sigma_B, p_B, mu_C, sigma_C, p_C )
% Generates a MAP (Maximum A Posteriori) decision boundary
% between two classes in the form of an output matrix

    if nargin < 11
        points = zeros(size(X, 1), size(Y, 2));

        Q_0 = inv(sigma_A) - inv(sigma_B);
        Q_1 = 2 * ( mu_B*(inv(sigma_B)) - mu_A*(inv(sigma_A)) );
        Q_2 = mu_A*(inv(sigma_A))*mu_A' - mu_B*(inv(sigma_B))*mu_B';
        Q_3 = log(p_B / p_A);
        Q_4 = log(det(sigma_A) / det(sigma_B));

        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                point = [X(i, j), Y(i, j)];
                points(i, j) = point*Q_0*point' + Q_1*point' + Q_2 + 2*Q_3 + Q_4;
            end
        end
        
    else
        
        % TODO
        
    end

end

