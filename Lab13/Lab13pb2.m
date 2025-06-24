f = @(x) x - cos(x);
df = @(x) 1 + sin(x);

x0 = pi/4;
eps = 1e-4;
N = 100;

for n = 1:N
    x1 = x0 - f(x0)/df(x0);
    if abs(x1 - x0) < eps
        break;
    end
    x0 = x1;
end

fprintf('Root approximation: %.10f\n', x1);
fprintf('Iterations needed: %d\n', n);
