f = @(x) [x(1)^3 + 3*x(2)^2 - 21;
          x(1)^2 + 2*x(2) + 2];

J = @(x) [3*x(1)^2, 6*x(2);
          2*x(1),    2];

x = [1; -1];
epsilon = 1e-6;
max_iter = 100;
iter = 0;

while norm(f(x)) > epsilon && iter < max_iter
    x = x - J(x) \ f(x);
    iter = iter + 1;
end

fprintf('Solution: x1 = %.6f, x2 = %.6f\n', x(1), x(2));