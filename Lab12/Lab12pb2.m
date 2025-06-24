A = [3 1 1; -2 4 0; -1 2 -6];
b = [12; 2; -5];
x0 = zeros(3,1);
epsilon = 1e-5;
N = 1000;
omega = 1.2; 
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);

% Jacobi Method 
x = x0;
for it = 1:N
    x_new = D \ (b - (L + U)*x);
    if norm(x_new - x, inf) < epsilon
        break;
    end
    x = x_new;
end

format long
fprintf('Jacobi solution after %d iterations:\n', it-1);
for i = 1:length(x_new)
    fprintf('%.10f\n', x_new(i));
end


% Gauss-Seidel Method 
x = x0;
for it = 1:N
    x_new = (D + L) \ (b - U*x);
    if norm(x_new - x, inf) < epsilon
        break;
    end
    x = x_new;
end
format long
fprintf('Gauss-Seidel solution after %d iterations:\n', it-1);
for i = 1:length(x_new)
    fprintf('%.10f\n', x_new(i));
end

% SOR Method 
x = x0;
for it = 1:N
    x_new = (D + omega*L) \ ((1-omega)*D*x + omega*b - omega*U*x);
    if norm(x_new - x, inf) < epsilon
        break;
    end
    x = x_new;
end

format long
fprintf('SOR(%.1f) solution after %d iterations:\n', omega, it-1);
for i = 1:length(x_new)
    fprintf('%.10f\n', x_new(i));
end
