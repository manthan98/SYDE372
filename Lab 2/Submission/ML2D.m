function points = ML2D(X, Y, a, b, c)
    %calculating sample mean of each cluster
    mu_A = sum(a)/length(a);
    mu_B = sum(b)/length(b);
    mu_C = sum(c)/length(c);
    
    %calculating sample covariance of each cluster
    sigma_A = (1/length(a))*(a'*a) - mu_A'*mu_A;
    sigma_B = (1/length(b))*(b'*b) - mu_B'*mu_B;
    sigma_C = (1/length(c))*(c'*c) - mu_C'*mu_C;
    
    ML_AB = MLHelper(X, Y, mu_A, sigma_A, mu_B, sigma_B);
    ML_BC = MLHelper(X, Y, mu_B, sigma_B, mu_C, sigma_C);
    ML_CA = MLHelper(X, Y, mu_C, sigma_C, mu_A, sigma_A);

    points = zeros(size(X, 1), size(Y, 2));

    c = 1;
    d = 2;
    e = 3;

    for i = 1:size(X, 1)
        for j = 1:size(Y, 2)
            if ML_AB(i, j) >= 0 && ML_BC(i, j) <= 0
                points(i, j) = d;
            elseif ML_AB(i, j) <= 0 && ML_CA(i, j) >= 0
                points(i, j) = c;
            elseif ML_BC(i, j) >= 0 && ML_CA(i, j) <= 0
                points(i, j) = e;
            else
                % wut
            end
        end
    end
end

