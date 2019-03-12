function y = ParzenGaus1d(samples, sigma, x)
    n = length(x);
    y = zeros(size(x));
    for i = 1:length(y)
        %v = (1/n)*sum((1/(2*pi*sigma))*exp(-1/2*(((x(i) - samples)/sigma).^2)));
        v = (1/n)*(sum(normpdf(x(i), samples, sigma)));
        y(i) = v;
    end
end

