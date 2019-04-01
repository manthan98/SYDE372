function [ results ] = GED( points, mu, sigma )
% Generates an GED classifier
% in the form of an output matrix
% mu - array of class means
% sigma - array of class covariances
        
        results = zeros(1, length(points));
        
        
%         class a = 1;
%         class b = 2;
%         class c = 3;
%         class d = 4;
%         class e = 5;
%         class f = 6;
%         class g = 7;
%         class h = 8;
%         class i = 9;
%         class j = 10;
        
   
        for i = 1:length(points)
            point = points(i, :);

            geds = zeros(1, 10);

            for k = 1:10
                curr_mu = mu(:, :, k);
                curr_sigma = sigma(:, :, k);
                geds(k) = sqrt( (point - curr_mu) * (inv(curr_sigma)) * (point - curr_mu)' );
            end

%                 ged_A = sqrt( (point - mu_A) * (inv(sigma_A)) * (point - mu_A)' );
%                 ged_B = sqrt( (point - mu_B) * (inv(sigma_B)) * (point - mu_B)' );
%                 ged_C = sqrt( (point - mu_C) * (inv(sigma_C)) * (point - mu_C)' );
%                 ged_D = sqrt( (point - mu_D) * (inv(sigma_D)) * (point - mu_D)' );
%                 ged_E = sqrt( (point - mu_E) * (inv(sigma_E)) * (point - mu_E)' );
%                 ged_F = sqrt( (point - mu_F) * (inv(sigma_F)) * (point - mu_F)' );
%                 ged_G = sqrt( (point - mu_G) * (inv(sigma_G)) * (point - mu_G)' );
%                 ged_H = sqrt( (point - mu_H) * (inv(sigma_H)) * (point - mu_H)' );
%                 ged_I = sqrt( (point - mu_I) * (inv(sigma_I)) * (point - mu_I)' );
%                 ged_J = sqrt( (point - mu_J) * (inv(sigma_J)) * (point - mu_J)' );
%                 
%                 geds = [ged_A ged_B ged_C ged_D ged_E ged_F ged_G ged_H ged_I ged_J];

            [minVal pos] = min(geds);
            
            results(i) = pos;
        end

end