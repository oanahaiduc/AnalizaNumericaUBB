n = 6;
A = 3 * eye(n);
for i = 1:n-1
    A(i, i+1) = -1;
    A(i+1, i) = -1;
end
b = [2; ones(n-2,1); 2];
x0 = zeros(n,1);
epsilon = 1e-6;
N = 1000;
omega = 1.2;

% Jacobi Method
x = x0;
for it = 1:13
    x_new = x; % Start with previous values
    for i = 1:n
        s = A(i, :) * x - A(i, i) * x(i);
        x_new(i) = (b(i) - s) / A(i, i);
    end
    if norm(x_new - x, inf) / max(norm(x_new, inf), 1) < epsilon
        break;
    end
    x = x_new;
end

format long
fprintf('Jacobi solution after %d iterations:\n', it);
for i = 1:length(x_new)
    fprintf('%.10f\n', x_new(i));
end

% Gauss-Seidel Method
x = x0;
for it = 1:9
    x_old = x;
    for i = 1:n
        s1 = A(i, 1:i-1) * x(1:i-1);
        s2 = A(i, i+1:n) * x(i+1:n);
        x(i) = (b(i) - s1 - s2) / A(i, i);
    end
    if norm(x - x_old, inf) / max(norm(x, inf), 1) < epsilon
        break;
    end
end

fprintf('Gauss-Seidel solution after %d iterations:\n', it);
for i = 1:length(x)
    fprintf('%.10f\n', x(i));
end

% Successive Over-Relaxation (SOR) Method
x = x0;
for iter = 1:7
    x_old = x;
    for i = 1:n
        sigma = A(i,1:i-1)*x(1:i-1) + A(i,i+1:n)*x_old(i+1:n);
        x(i) = x_old(i) + omega * ((b(i) - sigma)/A(i,i) - x_old(i));
    end
    if norm(x - x_old, inf) < epsilon
        break;
    end
end
fprintf('SOR(%.1f) solution after %d iterations:\n', omega, 14);
fprintf('%.10f\n', x);
