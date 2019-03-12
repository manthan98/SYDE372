%% 2. Model Estimation 1-D Case

%load necessary
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

legend('True p(x)', 'Estimated p(x)');

% Variable b
[mu_b, sigma_b] = Gaussian1D(b);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, normpdf(x, mu_b, sigma_b)); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

% Parametric Estimation - Exponential

% Variable a
lambda_a = Exponential1D(a);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, exppdf(x, 1 / lambda_a)); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

% Variable b
lambda_b = Exponential1D(b);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, exppdf(x, 1 / lambda_b)); % Estimated PDF

% Parametric Estimation - Uniform

% Variable a
[unifa_a, unifb_a] = Uniform1D(a);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, unifpdf(x, unifa_a, unifb_a)); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

% Variable b
[unifa_b, unifb_b] = Uniform1D(b);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, unifpdf(x, unifa_b, unifb_b)); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

% Non Parametric Estimation - Parzen Window with sigma = 0.1

% Variable a
y1_a = ParzenGaus1d(a, 0.1, x);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, y1_a); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

% Variable b
y1_b = ParzenGaus1d(b, 0.1, x);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, y1_b); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

% Non Parametric Estimation - Parzen Window with sigma = 0.4

% Variable a
y2_a = ParzenGaus1d(a, 0.4, x);

figure;
plot(x, normpdf(x, 5, 1)); % True PDF

hold on;
plot(x, y2_a); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

% Variable b
y2_b = ParzenGaus1d(b, 0.4, x);

figure;
plot(x, exppdf(x, 1)); % True PDF 

hold on;
plot(x, y2_b); % Estimated PDF

legend('True p(x)', 'Estimated p(x)');

