f = @(t) exp(-t.^2);
a = 0;
b = 0.5;

n_values = [4, 10];

for n = n_values
    h = (b - a) / n;

    x_nodes = linspace(a, b, n+1);
    x_mids = (x_nodes(1:end-1) + x_nodes(2:end)) / 2;

    f_endpoints = f(a) + f(b);
    f_mids = f(x_mids);
    f_inner = f(x_nodes(2:end-1));

    integral = (b - a) / (6 * n) * (f_endpoints + 4 * sum(f_mids) + 2 * sum(f_inner));

    erf_approx = 2 / sqrt(pi) * integral;

    fprintf('For n = %2d erf(0.5): %.9f\n', n, erf_approx);
end

