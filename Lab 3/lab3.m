close all;
addpath('./data');
load feat.mat;

resf2 = SplitArrays(f2);
resf2t = SplitArrays(f2t);
resf8 = SplitArrays(f8);
resf8t = SplitArrays(f8t);
resf32 = SplitArrays(f32);
resf32t = SplitArrays(f32t);

%% Labelled Classification

% f2
mu_f2 = zeros(1,2,10); % Mean
sigma_f2 = zeros(2,2,10); % Covariance

% Compute mean and covariance
for i = 1:10
    mu_f2(:,:,i) = mean(resf2(:,:,i));
    sigma_f2(:,:,i) = cov(resf2(:,:,i));
end

% Prepare data for use in GED utility function
f2tMatrix = [];
for i = 1:10
    f2tMatrix = [f2tMatrix; resf2t(:, :, i)];
end

% Confusion and error matrices
f2t_actual = f2t(3, :);
f2t_predicted = GED(f2tMatrix, mu_f2, sigma_f2);
[conf_mat_f2, error_rates_f2] = generateConfusionMatrix(f2t_actual, f2t_predicted);

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

% Confusion and error matrices
f8t_actual = f8t(3, :);
f8t_predicted = GED(f8tMatrix, mu_f8, sigma_f8);
[conf_mat_f8, error_rates_f8] = generateConfusionMatrix(f8t_actual, f8t_predicted);

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

% Confusion and error matrices
f32t_actual = f32t(3, :);
f32t_predicted = GED(f32tMatrix, mu_f32, sigma_f32);
[conf_mat_f32, error_rates_f32] = generateConfusionMatrix(f32t_actual, f32t_predicted);

%% Image Classification and Segmentation

% Multf8
cimage = GED_MATRIX(multf8, mu_f8, sigma_f8);
figure;
imagesc(cimage);
xlabel('x_{1}');
ylabel('x_{2}');

% Multim
figure;
imagesc(multim);
xlabel('x_{1}');
ylabel('x_{2}');