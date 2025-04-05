x = [144, 196, 225]; 
y = [12, 14, 15];

x_interpolation = 219;

n = length(x);
w = ones(1, n);

for j = 1:n 
    for k = [1:j-1, j+1:n]
        w(j) = w(j) / (x(j) - x(k));
    end
end

num= 0;
den = 0;
for j = 1:n
    term = w(j) / (x_interpolation - x(j));
    num = num + term * y(j);
    den = den + term;
end

y_interpolation = num / den;

fprintf('Approx sqrt(219): %.5f\n', y_interpolation);
