x = [0, pi/2, pi, 3*pi/2, 2*pi];
f = sin(x);
%for point a) we need to evaluate the function in x=pi/4
x_a = pi/4;


f_value = sin(x_a);

% natural cubic spline 
y_natural = spline(x, f, x_a);

% cubic clamped spline; first derivatives of the ends of the interval
fp0 = cos(0);         % f'(0) = cos(0) = 1
fpn = cos(2*pi);      % f'(2*pi) = cos(2*pi) = 1
y_clamped = spline(x, [fp0 f fpn], x_a);  

fprintf('f(pi/4) = %.10f\n', f_value);
fprintf('Cubic natural spline at pi/4 = %.10f\n', y_natural);
fprintf('Cubic clamped spline at pi/4 = %.10f\n', y_clamped);

% b)
x_b = linspace(0, 2*pi, 1000);
y_b = sin(x_b);
y_b_natural = spline(x, f, x_b);
y_b_clamped = spline(x, [fp0 f fpn], x_b);

figure;
plot(x_b, y_b, 'b', 'LineWidth', 2); 
hold on;
plot(x_b, y_b_natural, '--k', 'LineWidth', 2);
plot(x_b, y_b_clamped, '-.m', 'LineWidth', 2);
legend('f(x) = sin(x)', 'natural cubic spline', 'clamped cubic spline');
xlabel('x'); ylabel('y');
title('Spline Interpolation of sin(x)');
grid on;
hold off;
