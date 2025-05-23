%approx of double integral using trapezium formula
f = @(x, y) log(x + 2*y);

a = 1.4; 
b = 2;
c = 1;
d = 1.5;

integral = ((b - a) * (d - c)) / 16 * (f(a,c) + f(a,d) + ... 
    f(b,c) + f(b,d) + 2 * f((a+b)/2,c) + 2 * f((a+b)/2,d) + ...
    2 * f(a, (c+d)/2) + 2 * f(b, (c+d)/2) + 4 * f((a+b)/2, (c+d)/2));


fprintf('Approximation of the double integral: %.7f\n', integral);

