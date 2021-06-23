function [ results ] = GED( points, mu, sigma )
% Generates an GED classifier in the form of an output matrix
% mu - matrix of class means
% sigma - matrix of class covariances
        
        results = zeros(1, length(points));     
   
        for i = 1:length(points)
            point = points(i, :);

            geds = zeros(1, 10);

            for k = 1:10
                curr_mu = mu(:, :, k);
                curr_sigma = sigma(:, :, k);
                geds(k) = sqrt( (point - curr_mu) * (inv(curr_sigma)) * (point - curr_mu)' );
            end

            [~, pos] = min(geds);
            
            results(i) = pos;
        end

end