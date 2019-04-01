function [ points ] = GED( X, Y, mu_A, sigma_A, mu_B, sigma_B, mu_C, sigma_C, mu_D, sigma_D, mu_E, sigma_E, mu_F, sigma_F, mu_G, sigma_G, mu_H, sigma_H, mu_I, sigma_I, mu_J, sigma_J )
% Generates an GED classifier in the form of an output matrix
        
        points = zeros(size(X, 1), size(Y, 2));
    
        a = 1;
        b = 2;
        c = 3;
        d = 4;
        e = 5;
        f = 6;
        g = 7;
        h = 8;
        I = 9;
        J = 10;
        
    
        for i = 1:size(X, 1)
            for j = 1:size(Y, 2)
                point = [X(i, j) Y(i, j)];

                ged_A = sqrt( (point - mu_A) * (inv(sigma_A)) * (point - mu_A)' );
                ged_B = sqrt( (point - mu_B) * (inv(sigma_B)) * (point - mu_B)' );
                ged_C = sqrt( (point - mu_C) * (inv(sigma_C)) * (point - mu_C)' );
                ged_D = sqrt( (point - mu_D) * (inv(sigma_D)) * (point - mu_D)' );
                ged_E = sqrt( (point - mu_E) * (inv(sigma_E)) * (point - mu_E)' );
                ged_F = sqrt( (point - mu_F) * (inv(sigma_F)) * (point - mu_F)' );
                ged_G = sqrt( (point - mu_G) * (inv(sigma_G)) * (point - mu_G)' );
                ged_H = sqrt( (point - mu_H) * (inv(sigma_H)) * (point - mu_H)' );
                ged_I = sqrt( (point - mu_I) * (inv(sigma_I)) * (point - mu_I)' );
                ged_J = sqrt( (point - mu_J) * (inv(sigma_J)) * (point - mu_J)' );
                
                geds = [ged_A ged_B ged_C ged_D ged_E ged_F ged_G ged_H ged_I ged_J];

                if ged_A == min(geds)
                    points(i, j) = a;
                elseif ged_B == min(geds)
                    points(i, j) = b;
                elseif ged_C == min(geds)
                    points(i, j) = c;
                elseif ged_D == min(geds)
                    points(i, j) = d;
                elseif ged_E == min(geds)
                    points(i, j) = e;
                elseif ged_F == min(geds)
                    points(i, j) = f;
                elseif ged_G == min(geds)
                    points(i, j) = g;
                elseif ged_H == min(geds)
                    points(i, j) = h;
                elseif ged_I == min(geds)
                    points(i, j) = I;
                else
                    points(i, j) = J;
                end
            end
        end

end