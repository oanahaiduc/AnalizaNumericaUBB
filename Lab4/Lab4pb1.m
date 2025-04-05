x = [1, 1.5, 2, 3, 4];
y = [0, 0.17609, 0.30103, 0.47712, 0.60206];

n = length(x);
dd_table = zeros(n,n);
dd_table(:,1) = y'; 

for j = 2:n
    for i = 1:n-j+1
        dd_table(i,j) = (dd_table(i+1,j-1) - dd_table(i,j-1)) / (x(i+j-1) - x(i));
    end
end

newton_pol = @(val) dd_table(1,1) + ...
    dd_table(1,2)*(val - x(1)) + ...
    dd_table(1,3)*(val - x(1))*(val - x(2)) + ...
    dd_table(1,4)*(val - x(1))*(val - x(2))*(val - x(3)) + ...
    dd_table(1,5)*(val - x(1))*(val - x(2))*(val - x(3))*(val - x(4));

val1 = 2.5; % the values that i want to approximate
val2 = 3.25;

aprox1 = newton_pol(val1);
aprox2 = newton_pol(val2);

% the exact values 
v1 = log10(val1);
v2 = log10(val2);

% errors = real value - approx 
error1 = abs(v1 - aprox1);
error2 = abs(v2 - aprox2);

fprintf('log10(2.5): %.6f, error = %.2e\n', aprox1, error1);
fprintf('log10(3.25): %.6f, error = %.2e\n', aprox2, error2);


% yi = i/10, i = 10 to 35
max_error = 0;
max_yi = 0;

for i = 10:35
    yi = i / 10;
    true_val = log10(yi);
    interp_val = newton_pol(yi);
    error = abs(true_val - interp_val);
    
    if error > max_error
        max_error = error;
        max_yi = yi;
    end
end

fprintf('Max interpolation error E = %.4e at y = %.2f\n', max_error, max_yi);