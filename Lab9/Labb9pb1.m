% a) 
a = 1;
b = 1.5; 
f = @(x) exp(-x.^2); 

midpoint = (a + b) / 2;
approx_a = (b - a) * f(midpoint); 

fprintf('a) Approximation using midpoint rule (n=1): %.4f\n', approx_a);

% b)
x = linspace(1, 1.5, 100); 
y = f(x); 

figure;
plot(x, y, 'b-', 'LineWidth', 2, 'DisplayName', 'f(x) = e^{-x^2}'); 
hold on;



rectangle('Position', [1, 0, 0.5, f(midpoint)], 'EdgeColor', 'k')

plot(midpoint, f(midpoint), 'ro', 'MarkerSize', 8, 'DisplayName', 'Midpoint (1.25, f(1.25))');

xlabel('x');
ylabel('y');
title('Function f(x) = e^{-x^2} and Midpoint Rectangle Approximation');
legend('show');
grid on;
hold off;

% c)
n_values = [150, 500]; 

for n = n_values
    h = (b - a) / n; 
    i = 1:n;
    x_i = a + (2 * i - 1) / (2 * n) * (b - a);
    f_xi = f(x_i); 
    approx_c = (b - a) / n * sum(f_xi); 
    
    fprintf('c) Approximation using repeated midpoint rule (n=%d): %.4f\n', n, approx_c);
end

