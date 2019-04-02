function [ conf_mat, error_rates ] = generateConfusionMatrix( actual, predicted )
% Generates confusion matrix and error rates matrix for predicted and
% actual input matrices

    conf_mat = zeros(10, 10);
    for i = 1:length(actual)
        truth = actual(i);
        classified = predicted(i);
        conf_mat(truth, classified) = conf_mat(truth, classified) + 1;
    end
    
    error_rates = zeros(10, 1);
    for i = 1:size(conf_mat, 1)
        top = sum(conf_mat(i, :)) - conf_mat(i, i);
        error_rates(i) = (top / sum(conf_mat(i, :))) * 100;
    end

end

