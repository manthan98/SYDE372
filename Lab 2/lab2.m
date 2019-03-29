%% 2. Model Estimation 1-D Case

%load necessary data
load('lab2_1.mat')

% Setup a range of values for plotting purposes
x = 0:0.01:(max(a(1, :)) + 1);

% Parametric Estimation - Gaussian

% Variable a
[mu_a, sigma_a] = Gaussian1D(a);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, normpdf(x, mu_a, sigma_a)); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Variable b
[mu_b, sigma_b] = Gaussian1D(b);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, normpdf(x, mu_b, sigma_b)); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Parametric Estimation - Exponential

% Variable a
lambda_a = Exponential1D(a);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, exppdf(x, 1 / lambda_a)); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Variable b
lambda_b = Exponential1D(b);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, exppdf(x, 1 / lambda_b)); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Parametric Estimation - Uniform

% Variable a
[unifa_a, unifb_a] = Uniform1D(a);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, unifpdf(x, unifa_a, unifb_a)); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Variable b
[unifa_b, unifb_b] = Uniform1D(b);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, unifpdf(x, unifa_b, unifb_b)); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Non Parametric Estimation - Parzen Window with sigma = 0.1

% Variable a
y1_a = ParzenGaus1d(a, 0.1, x);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, y1_a); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Variable b
y1_b = ParzenGaus1d(b, 0.1, x);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, y1_b); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Non Parametric Estimation - Parzen Window with sigma = 0.4

% Variable a
y2_a = ParzenGaus1d(a, 0.4, x);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, y2_a); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

% Variable b
y2_b = ParzenGaus1d(b, 0.4, x);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, y2_b); % Estimated PDF

xlabel('x');
ylabel('p(x)');
legend('True p(x)', 'Estimated p(x)');

%% 3. Model Estimation 2-D Case

%load necessary data
load('lab2_2.mat')

% Step size - the smaller the value the smoother
dx = 0.2;

% Generate a matrix of values incremented by the step variable
% ranging from smallest x/y values in the cluster data to the largest
x = min([al(:,1);bl(:,1);cl(:,1)])-1:dx:max([al(:,1);bl(:,1);cl(:,1)])+1;
y = min([al(:,2);bl(:,2);cl(:,2)])-1:dx:max([al(:,2);bl(:,2);cl(:,2)])+1;

[X, Y] = meshgrid(x, y);

% Parametric (ML) Estimation Using Gaussian Distribution

ML = ML2D(X, Y, al, bl, cl);
figure;
contour(X, Y, ML,'Color', 'black', 'LineWidth', 1, 'HandleVisibility', 'off');

hold on;
scatter(al(:, 1), al(:, 2), 'rx');

hold on;
scatter(bl(:, 1), bl(:, 2), 'bo');

hold on;
scatter(cl(:, 1), cl(:, 2), 'gx');

xlabel('x_{1}');
ylabel('x_{2}');
legend('Cluster A', 'Cluster B', 'Cluster C');

% Non Parametric Estimation Using Gaussian Parzen Window

% Build Gaussian window
h = 400;
mu = [h/2 h/2]; % Mean
sigma = [h 0; 0 h]; % Covariance

[x1, x2] = meshgrid(1:1:400); % Simulate one window
window = mvnpdf([x1(:) x2(:)], mu, sigma); % PDF for window
window = reshape(window, length(x1), length(x2)); % Rearrange in columnar format

% Define resolution boundaries
res = [1 min(x) min(y) max(x) max(y)];

[pa, xa, ya] = parzen(al, res, window);
[pb, xb, yb] = parzen(bl, res, window);
[pc, xc, yc] = parzen(cl, res, window);

% Since xa = xb = xc and ya = yb = yc
[X2, Y2] = meshgrid(xa, ya);

% Generate the ML boundary
ML_2 = ML2D_Parzen(X2, Y2, pa, pb, pc);

figure;
contour(X2, Y2, ML_2, 'Color', 'black', 'LineWidth', 1, 'HandleVisibility', 'off');

hold on;
scatter(al(:, 1), al(:, 2), 'rx');

hold on;
scatter(bl(:, 1), bl(:, 2), 'bo');

hold on;
scatter(cl(:, 1), cl(:, 2), 'gx');

xlabel('x_{1}');
ylabel('x_{2}');
legend('Cluster A', 'Cluster B', 'Cluster C');


%% 4. Sequential Discriminants
%load necessary data
load('lab2_3.mat')
[sequentialDiscriminants1, nab1, nba1] = SequentialDiscriminants(a,b);
[sequentialDiscriminants2, nab2, nba2] = SequentialDiscriminants(a,b);
[sequentialDiscriminants3, nab3, nba3] = SequentialDiscriminants(a,b);

points1 = ClassifySequentialDiscriminants(a,b,sequentialDiscriminants1, nab1, nba1);
points2 = ClassifySequentialDiscriminants(a,b,sequentialDiscriminants2, nab2, nba2);
points3 = ClassifySequentialDiscriminants(a,b,sequentialDiscriminants3, nab3, nba3);

figure;
hold on;
contour(points1, [0,0]);
scatter(a(:,1), a(:,2));
scatter(b(:,1), b(:,2));
xlabel('x_{1}');
ylabel('x_{2}');
legend('Classification Boundary','Class A', 'Class B');

figure;
hold on;
contour(points2, [0,0]);
scatter(a(:,1), a(:,2));
scatter(b(:,1), b(:,2));
xlabel('x_{1}');
ylabel('x_{2}');
legend('Classification Boundary','Class A', 'Class B');


figure;
hold on;
contour(points3, [0,0]);
scatter(a(:,1), a(:,2));
scatter(b(:,1), b(:,2));
xlabel('x_{1}');
ylabel('x_{2}');
legend('Classification Boundary','Class A', 'Class B');

