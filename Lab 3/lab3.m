addpath('./data');
load feat.mat;

%aplot(face);

resf2 = SplitArrays(f2);
resf8 = SplitArrays(f8);
resf32 = SplitArrays(f32);

mu = zeros(1,2,10);
sigma = zeros(2,2,10);

for i = 1:10
    mu(:,:,i) = mean(resf2(:,:,i));
    sigma(:,:,i) = cov(resf2(:,:,i));
end

f2Matrix = [];
for i = 1:10
    f2Matrix = [f2Matrix; resf2(:, :, i)];
end

MICD_result = GED(f2Matrix, mu, sigma)
