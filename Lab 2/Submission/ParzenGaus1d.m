function y = ParzenGaus1d(samples, sigma, x)
    %samples - points in unknown class 
    %x - range of values along x axis (like a scale for the x axis)
    n = length(samples);
    y = zeros(1, length(x));
    for i = 1:length(samples)
        %v = (1/n)*sum((1/(2*pi*sigma))*exp(-1/2*(((x(i) - samples)/sigma).^2)));
        y = y + (1/n)*(normpdf(x, samples(i), sigma));
    end
end

