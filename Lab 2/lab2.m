%% Model Estimation 1-D Case

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

legend('True p(x)', 'Estimated p(x)');