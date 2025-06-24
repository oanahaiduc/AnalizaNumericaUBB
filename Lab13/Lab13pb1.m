format long;

eps = 1e-10;
x0 = 0.5;
max_iter = 100;

fprintf('1)\n');
x = x0;
for k = 1:max_iter
    x_new = exp(-x);
    if abs(x_new - x) < eps
        break;
    end
    x = x_new;
end
fprintf('Approximation: %.15f, Iterations: %d\n\n', x, k);


fprintf('2)\n');
x = x0;
for k = 1:max_iter
    x_new = (1 + x)/(exp(x) + 1);
    if abs(x_new - x) < eps
        break;
    end
    x = x_new;
end
fprintf('Approximation: %.15f, Iterations: %d\n\n', x, k);


fprintf('3)\n');
x = x0;
for k = 1:max_iter
    x_new = x + 1 - x*exp(x);
    if abs(x_new - x) < eps
        break;
    end
    x = x_new;
end
fprintf('Approximation: %.15f, Iterations: %d\n\n', x_new, k);