% a) integral with trapezium = (b-a)/2 * (f(a) + f(b)) with a = 0; b = 1
f = @(x) 2 ./ (1 + x.^2);

a = 0;
b = 1;
fa = f(a);
fb = f(b);

integral_trapezium = (b - a)/2 * (fa + fb);

fprintf('Approximation with trapezium quadrature formula: %f\n', integral_trapezium);


% b) graph of f and graph of trapezium with vertices (0,0), (0,f(0)), (1,f(1)), and (1,0).

figure;
fplot(f, [a b], 'm', 'LineWidth', 2);
hold on;

% trapezium points: (0,0) (0,f(0)) (1,f(1)) (1,0) (0,0)
plot([0 0 1 1 0], [0 fa fb 0 0], 'k-o', 'LineWidth', 1.5, 'MarkerSize', 6);
grid on;

xlabel('x');
ylabel('f(x) = 2/(1 + x^2)');
title('Function and single trapezium');
legend('f(x)', 'Trapezium', 'Location', 'Best');
hold off;


% c) integral with Simpson's = (b-a)/6 * [ f(a) + 4*f((a+b)/2) + f(b) ]
integral_simpsons = (b - a)/6 * ( f(a) + 4*f((a + b)/2) + f(b) );

fprintf('Approximation with Simpson s quadrature formula: %f\n', integral_simpsons);

