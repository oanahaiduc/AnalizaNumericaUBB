f = @(x) 1 ./ (1 + x.^2); 
a = 0; 
b = 1; 
epsilon = 1e-4;

% a)
h = b - a; 
Q = zeros(1, 10); 

Q(1) = (h / 2) * (f(a) + f(b)); % Q_T0 = (h/2) * (f(0) + f(1))
fprintf('a): Romberg''s method for trapezium formula\n');

k = 1;
while true
    % sum for odd points: a + (2j-1)/(2^k) * h
    sum_odd = 0;
    num_points = 2^(k-1); % nr of points to evaluate: 2^(k-1)
    for j = 1:num_points
        x_j = a + (2 * j - 1) / (2^k) * h;
        sum_odd = sum_odd + f(x_j);
    end
    % Q_Tk = (1/2) * Q_T(k-1) + (h/2^k) * sum(f(odd points))
    Q(k+1) = (1/2) * Q(k) + (h / (2^k)) * sum_odd;
    
    
    if k > 0 && abs(Q(k+1) - Q(k)) <= epsilon
        fprintf('Approximation: %.6f\n', Q(k+1));
        break;
    end
    k = k + 1;
end

% b)
fprintf('\nb): Romberg''s method in Aitken''s form\n');

T = zeros(10, 10); 
T(1, 1) = (h / 2) * (f(a) + f(b)); 

k = 1;
while true
    sum_odd = 0;
    num_points = 2^(k-1);
    for j = 1:num_points
        x_j = a + (2 * j - 1) / (2^k) * h;
        sum_odd = sum_odd + f(x_j);
    end
    T(k+1, 1) = (1/2) * T(k, 1) + (h / (2^k)) * sum_odd;
    
    for j = 2:(k+1)
        T(k+1, j) = (4^(j-1) * T(k, j-1) - T(k+1, j-1)) / (4^(j-1) - 1);
    end
    
    if k > 0 && abs(T(k+1, k+1) - T(k, k)) <= epsilon
        fprintf('Approximation: %.6f\n', T(k+1, k+1));
        break;
    end
    k = k + 1;
end

exact = pi / 4;
fprintf('\nExact value (pi/4): %.6f\n', exact);