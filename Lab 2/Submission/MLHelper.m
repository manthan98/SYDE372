function points = MLHelper(X, Y, mu_A, sigma_A, mu_B, sigma_B)
        %Calculates ML decision boundary for a 2 class case
        points = zeros(size(X, 1), size(Y, 2));

        Q_0 = inv(sigma_A) - inv(sigma_B);
        Q_1 = 2 * ( mu_B*(inv(sigma_B)) - mu_A*(inv(sigma_A)) );
        Q_2 = mu_A*(inv(sigma_A))*mu_A' - mu_B*(inv(sigma_B))*mu_B';
        Q_4 = log(det(sigma_A) / det(sigma_B));

        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                point = [X(i, j), Y(i, j)];
                points(i, j) = point*Q_0*point' + Q_1*point' + Q_2 + Q_4;
            end
        end
end

