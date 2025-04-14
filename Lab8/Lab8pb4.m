f = @(x) x .* log(x);

a = 1;
b = 2;

integral_exact = 0.636294368858383;

accuracy = 0.0007;  

n = 1;

while true
    x = linspace(a, b, n+1);
    fx = f(x);
    
    integral_approx = ((b - a)/(2 * n)) * (fx(1) + 2*sum(fx(2:end-1)) + fx(end));
    
    if abs(integral_approx - integral_exact) < accuracy
        break;
    end
    
    n = n + 1;
end

fprintf('Smallest n with 3-decimal accuracy: %d\n', n);
fprintf('Approximate integral value: %.15f\n', integral_approx);
