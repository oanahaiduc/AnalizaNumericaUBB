a = 0; b = 1; N = 10;
h = (b - a) / N;
x = a:h:b;
y_euler = zeros(1, N+1);
y_rk4 = zeros(1, N+1);
y_exact = @(x) exp(-x) + 2*x - 2;

y_euler(1) = -1;
y_rk4(1) = -1;

f = @(x, y) 2*x - y; 

for i = 1:N
    y_euler(i+1) = y_euler(i) + h * f(x(i), y_euler(i));
end

for i = 1:N
    k1 = h * f(x(i), y_rk4(i));
    k2 = h * f(x(i) + h/2, y_rk4(i) + k1/2);
    k3 = h * f(x(i) + h/2, y_rk4(i) + k2/2);
    k4 = h * f(x(i) + h, y_rk4(i) + k3);
    y_rk4(i+1) = y_rk4(i) + (k1 + 2*k2 + 2*k3 + k4) / 6;
end

figure;
plot(x, y_euler, 'r-o', x, y_rk4, 'm-*', x, y_exact(x), 'k-', 'LineWidth', 1.5);
legend('Euler', 'RK4', 'Exact');
xlabel('x'); ylabel('y');
title('Euler, RK4 and Exact Solution');
grid on;