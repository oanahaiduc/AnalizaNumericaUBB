f = @(x) x.^3 - x.^2 - 1;

x0 = 1;
x1 = 2;
eps = 1e-4;
N = 100;

fprintf('Secant method iterations:\n');
for k = 1:N
    x2 = x1 - f(x1)*(x1 - x0)/(f(x1) - f(x0));
    fprintf('x_%d = %.10f\n', k+1, x2);
    if abs(x2 - x1) < eps
        break;
    end
    x0 = x1;
    x1 = x2;
end

fprintf('Root approximation: %.10f\n', x2);
fprintf('Iterations needed: %d\n', k);
