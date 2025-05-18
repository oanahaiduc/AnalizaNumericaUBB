f = @(x) (100 ./ x.^2) .* sin(10 ./ x); 
a = 1; 
b = 3; 
epsilon = 1e-4; 

x_plot = linspace(a, b, 200); 
y_plot = f(x_plot); 

figure;
plot(x_plot, y_plot, 'b-', 'LineWidth', 2, 'DisplayName', 'f(x) = (100/x^2) sin(10/x)');
xlabel('x');
ylabel('f(x)');
title('Graph of f(x) = (100/x^2) sin(10/x) over [1, 3]');
legend('show');
grid on;

approx_adaptive = adquad(a, b, epsilon, f);
fprintf('Adaptive Quadrature Approximation: %.10f\n', approx_adaptive);

n_values = [50, 100];
for n = n_values
    h = (b - a) / n; 
    x = a:h:b; 
    fx = f(x);
    
    sum_odd = sum(fx(2:2:end-1));   % Odd-indexed terms (x1, x3, ..., x_{n-1})
    sum_even = sum(fx(3:2:end-2));  % Even-indexed terms (x2, x4, ..., x_{n-2})
    
    approx_simpson = (h / 3) * (fx(1) + 4 * sum_odd + 2 * sum_even + fx(end));
    
    fprintf('Repeated Simpson''s Rule (n=%d): %.10f\n', n, approx_simpson);
end

exact = -1.4260247818;
fprintf('Exact value: %.10f\n', exact);

function I = adquad(a, b, er, f)
    simpson = @(a, b) (b - a) / 6 * (f(a) + 4 * f((a + b) / 2) + f(b));

    I1 = simpson(a, b);
    I2 = simpson(a, (a + b) / 2) + simpson((a + b) / 2, b);
    
    if abs(I1 - I2) < 15 * er
        I = I2;
    else
        I = adquad(a, (a + b) / 2, er / 2, f) + adquad((a + b) / 2, b, er / 2, f);
    end
end
