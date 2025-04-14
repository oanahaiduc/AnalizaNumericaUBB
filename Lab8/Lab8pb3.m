r = 110;
p = 75;
a = 0;
b = 2*pi;


f = @(x) sqrt(1 - (p/r)^2 * sin(x));

n_values = [10, 100]; 

for n = n_values
    h = (b - a) / n;

    x = linspace(a, b, n+1);

    fx = f(x);

    integral = (h/2) * (fx(1) + 2*sum(fx(2:end-1)) + fx(end));

    H = (60 * r / (r^2 - p^2)) * integral;
    
    fprintf('For n = %d approximation of H(p, r): %.4f\n', n, H);
end
