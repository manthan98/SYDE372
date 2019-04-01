addpath('./data');
load feat.mat;

%aplot(face);

resf2 = SplitArrays(f2);
resf2t = SplitArrays(f2t);
resf8 = SplitArrays(f8);
resf8t = SplitArrays(f8t);
resf32 = SplitArrays(f32);
resf32t = SplitArrays(f32t);

% f2
mu_f2 = zeros(1,2,10);
sigma_f2 = zeros(2,2,10);

for i = 1:10
    mu_f2(:,:,i) = mean(resf2(:,:,i));
    sigma_f2(:,:,i) = cov(resf2(:,:,i));
end

f2tMatrix = [];
for i = 1:10
    f2tMatrix = [f2tMatrix; resf2t(:, :, i)];
end

f2t_actual = f2t(3, :);

f2t_predicted = GED(f2tMatrix, mu_f2, sigma_f2);

conf_mat_f2 = zeros(10, 10);

for i = 1:length(f2t_actual)
    truth = f2t_actual(i);
    classified = f2t_predicted(i);
    conf_mat_f2(truth, classified) = conf_mat_f2(truth, classified) + 1;
end

% f8
mu_f8 = zeros(1,2,10);
sigma_f8 = zeros(2,2,10);

for i = 1:10
    mu_f8(:,:,i) = mean(resf8(:,:,i));
    sigma_f8(:,:,i) = cov(resf8(:,:,i));
end

f8tMatrix = [];
for i = 1:10
    f8tMatrix = [f8tMatrix; resf8t(:, :, i)];
end

f8t_actual = f8t(3, :);

f8t_predicted = GED(f8tMatrix, mu_f8, sigma_f8);

conf_mat_f8 = zeros(10, 10);

for i = 1:length(f8t_actual)
    truth_f8 = f8t_actual(i);
    classified_f8 = f8t_predicted(i);
    conf_mat_f8(truth_f8, classified_f8) = conf_mat_f8(truth_f8, classified_f8) + 1;
end

% f32
mu_f32 = zeros(1,2,10);
sigma_f32 = zeros(2,2,10);

for i = 1:10
    mu_f32(:,:,i) = mean(resf32(:,:,i));
    sigma_f32(:,:,i) = cov(resf32(:,:,i));
end

f32tMatrix = [];
for i = 1:10
    f32tMatrix = [f32tMatrix; resf32t(:, :, i)];
end

f32t_actual = f32t(3, :);

f32t_predicted = GED(f32tMatrix, mu_f32, sigma_f32);

conf_mat_f32 = zeros(10, 10);

for i = 1:length(f32t_actual)
    truth_f32 = f32t_actual(i);
    classified_f32 = f32t_predicted(i);
    conf_mat_f32(truth_f32, classified_f32) = conf_mat_f8(truth_f32, classified_f32) + 1;
end
