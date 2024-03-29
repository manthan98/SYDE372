close all;
rng(4);

%% CASE 1 %%

% Class A
mu_A = [5 10]; % Mean
sigma_A = [8 0; 0 4]; % Covariance
r_A = chol(sigma_A); % Cholesky factorization to diagonalize the covariance matrix
z_A = repmat(mu_A, 200, 1) + randn(200, 2) * r_A; % Gaussian distribution for n = 200
[eig_vecs_A, eig_vals_A] = eig(sigma_A); % Extract eigenvalues and eigenvectors

% Test Data A for NN and KNN
test_A = repmat(mu_A, 200, 1) + randn(200, 2) * r_A; % Gaussian distribution for n = 200

% Class B
mu_B = [10 15];
sigma_B = [8 0; 0 4];
r_B = chol(sigma_B);
z_B = repmat(mu_B, 200, 1) + randn(200, 2) * r_B;
[eig_vecs_B, eig_vals_B] = eig(sigma_B);

% Test Data B For NN and KNN
z_B = repmat(mu_B, 200, 1) + randn(200, 2) * r_B;

figure;
xlabel('x_1');
ylabel('x_2');
hold on;

% Scatter plot of z_A and z_B, where points in z_A
% are marked with red 'X' and points in z_B are
% marked with blue 'O'.
samples_a_scatter = scatter(z_A(:, 1), z_A(:, 2), 'rx');
samples_b_scatter = scatter(z_B(:, 1), z_B(:, 2), 'bo');

% Angular orientation of the unit contours, by computing
% the inverse tan of eigenvectors 1 and 2.
theta_A = atan(eig_vecs_A(2,2) / eig_vecs_A(2, 1));
theta_B = atan(eig_vecs_B(2,2) / eig_vecs_B(2, 1));

% Plot the means on top of scatter plot
% where mean A is represented by a green 'X'
% and mean B is represented by a green 'O'.
plot(mu_A(1), mu_A(2), 'gx');
plot(mu_B(1), mu_B(2), 'go');

legend('Class A', 'Class B', 'Mean of Class A', 'Mean of Class B');

% Plot an ellipse based on the original distribution
% using eigenvalues of A and B.
plot_ellipse(mu_A(1), mu_A(2), theta_A, sqrt(eig_vals_A(2,2)), sqrt(eig_vals_A(1,1)), 'r');
plot_ellipse(mu_B(1), mu_B(2), theta_B, sqrt(eig_vals_B(2,2)), sqrt(eig_vals_B(1,1)), 'b');

% Step size - the smaller the value the smoother
dx = 0.2;

% Generate a matrix of values incremented by the step variable
% ranging from smallest value of z_A to largest value of z_B.
x = min([z_A(:,1);z_B(:,1)])-1:dx:max([z_A(:,1);z_B(:,1)])+1;
y = min([z_A(:,2);z_B(:,2)])-1:dx:max([z_A(:,2);z_B(:,2)])+1;

% Useful for generating values over a range for some equation.
% Used for the different classifier cases equations. Each row
% is a copy of x and each column is a copy of Y.
[X1, Y1] = meshgrid(x, y);

% MED case
MED1 = MED(X1, Y1, mu_A, mu_B);
% contour(X1, Y1, MED1, [0, 0], 'Color', 'magenta', 'LineWidth', 2, 'HandleVisibility', 'off');

[Conf_Mat_MED1, exp_error_MED1] = ConfMat(X1(1, 1), Y1(1, 1), MED1, z_A, z_B)

% GED case
GED1 = GED(X1, Y1, mu_A, sigma_A, mu_B, sigma_B);
% contour(X1, Y1, GED1, [0, 0], 'Color', 'black', 'LineWidth', 2, 'HandleVisibility', 'off');

% MAP Case
MAP1 = MAP(X1, Y1, mu_A, sigma_A, 200, mu_B, sigma_B, 200);
% contour(X1, Y1, MAP1, [0, 0], 'Color', 'cyan', 'LineWidth', 2, 'HandleVisibility', 'off');

% NN Case
NN1 = NN(X1, Y1, z_A, z_B);
% contour(X1, Y1, NN1, [0, 0], 'Color', 'cyan', 'LineWidth', 2, 'HandleVisibility', 'off');

% KNN case
KNN1 = KNN(X1, Y1, 5, z_A, z_B);
% contour(X1, Y1, KNN1, [0,0], 'Color', 'black', 'LineWidth', 2, 'HandleVisibility', 'off');

%% CASE 2 %%
figure;
xlabel('x_1');
ylabel('x_2');
hold on;

% Class C
mu_C = [5 10];
sigma_C = [8 4; 4 40];
r_C = chol(sigma_C);
z_C = repmat(mu_C, 100, 1) + randn(100, 2) * r_C;
[eig_vecs_C, eig_vals_C] = eig(sigma_C);

% Test Data C For NN and KNN
test_C = repmat(mu_C, 100, 1) + randn(100, 2) * r_C;

% Class D
mu_D = [15 10];
sigma_D = [8 0; 0 8];
r_D = chol(sigma_D);
z_D = repmat(mu_D, 200, 1) + randn(200, 2) * r_D;
[eig_vecs_D, eig_vals_D] = eig(sigma_D);

% Test Data D For NN and KNN
test_D = repmat(mu_D, 200, 1) + randn(200, 2) * r_D;

% Class E
mu_E = [10 5];
sigma_E = [10 -5; -5 20];
r_E = chol(sigma_E);
z_E = repmat(mu_E, 150, 1) + randn(150, 2) * r_E;
[eig_vecs_E, eig_vals_E] = eig(sigma_E);

% Test Data E For NN and KNN
test_E = repmat(mu_E, 150, 1) + randn(150, 2) * r_E;

samples_C_scatter = scatter(z_C(:, 1), z_C(:, 2), 'rx');
samples_D_scatter = scatter(z_D(:, 1), z_D(:, 2), 'bo');
samples_E_scatter = scatter(z_E(:, 1), z_E(:, 2), 'k^');

theta_C = atan(eig_vecs_C(2,2) / eig_vecs_C(2, 1));
theta_D = atan(eig_vecs_D(2,2) / eig_vecs_D(2, 1));
theta_E = atan(eig_vecs_E(2,2) / eig_vecs_E(2, 1));

plot(mu_C(1), mu_C(2), 'gx');
plot(mu_D(1), mu_D(2), 'go');
plot(mu_E(1), mu_E(2), 'g+');

legend('Class C', 'Class D', 'Class E', 'Mean of Class C', 'Mean of Class D', 'Mean of Class E')

plot_ellipse(mu_C(1), mu_C(2), theta_C, sqrt(eig_vals_C(2,2)), sqrt(eig_vals_C(1,1)), 'r');
plot_ellipse(mu_D(1), mu_D(2), theta_D, sqrt(eig_vals_D(2,2)), sqrt(eig_vals_D(1,1)), 'b');
plot_ellipse(mu_E(1), mu_E(2), theta_E, sqrt(eig_vals_E(2,2)), sqrt(eig_vals_E(1,1)), 'b');

x2 = min([z_C(:,1);z_D(:,1);z_E(:,1)])-1:dx:max([z_C(:,1);z_D(:,1);z_E(:,1)])+1;
y2 = min([z_C(:,2);z_D(:,2);z_E(:,2)])-1:dx:max([z_C(:,2);z_D(:,2);z_E(:,2)])+1;

[X2, Y2] = meshgrid(x2, y2);

% MED case
MED2 = MED(X2, Y2, mu_C, mu_D, mu_E);
% contour(X2, Y2, MED2, 'Color', 'magenta', 'LineWidth', 2, 'HandleVisibility', 'off');

Conf_Mat_MED2 = ConfMat(X2(1, 1), Y2(1, 1), MED2, z_C, z_D, z_E)

% GED case
GED2 = GED(X2, Y2, mu_C, sigma_C, mu_D, sigma_D, mu_E, sigma_E);
% contour(X2, Y2, GED2, 'Color', 'cyan', 'LineWidth', 2, 'HandleVisibility', 'off');

% MAP case
MAP2 = MAP(X2, Y2, mu_C, sigma_C, 100, mu_D, sigma_D, 200, mu_E, sigma_E, 150);
% contour(X2, Y2, MAP2, 'Color', 'black', 'LineWidth', 2, 'HandleVisibility', 'off');

% NN case
NN2 = NN(X2, Y2, z_C, z_D, z_E);
% contour(X2, Y2, NN2, 'Color', 'black', 'LineWidth', 2, 'HandleVisibility', 'off');

% KNN case
KNN2 = KNN(X2, Y2, 3, z_C, z_D, z_E);
%contour(X2, Y2, KNN2,'Color', 'black', 'LineWidth', 2, 'HandleVisibility', 'off');

hold off;



