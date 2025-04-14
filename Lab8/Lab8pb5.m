f = @(x) 1 ./ (4 + sin(10 * x));

n_values = [10, 30];

a = 0;
b = pi;
fa = f(a);
fb = f(b);

for n = n_values
    x = linspace(a, b, n+1);
    x_mids = (x(1:end-1) + x(2:end)) / 2;
    f_mids = f(x_mids);         
    f_inner = f(x(2:end-1));

    integral = (b - a)/(6 * n) * (fa + fb + 4 * sum(f_mids) + 2 * sum(f_inner));

    fprintf('For n = %d approximation of the integral: %.7f\n', n, integral);

end
