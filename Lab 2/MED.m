function [ points ] = MED( X, Y, mu_A, mu_B)
    points = zeros(length(X), length(Y));
    for i = 1:length(X)
        for j = 1:length(Y)
            val = [X(i) Y(j)];
            points(i, j) = ( (val - mu_A) * (val - mu_A)' ) - ( (val - mu_B) * (val - mu_B)' );
        end
    end
end