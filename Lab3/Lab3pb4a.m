f = @(x) 1 ./ (1 + x.^2);

y_interv = -5:0.01:5;
f_interv = f(y_interv);

function P = barycentric_interp(X, Y, x)
    n = length(X);
    w = ones(1, n);

    for j = 1:n
        for k = [1:j-1, j+1:n]
            w(j) = w(j) / (X(j) - X(k));
        end
    end

    num = 0;
    den = 0;

    for j = 1:n
        if x == X(j)
            P = Y(j);
            return;
        end
        term = w(j) / (x - X(j));
        num = num + term * Y(j);
        den = den + term;
    end

    P = num / den;
end

n_val = [2, 4, 6, 8];
errors = zeros(size(n_val));

figure;
hold on;
plot(y_interv, f_interv, 'm', 'LineWidth', 2); 

for i = 1:length(n_val)
    n = n_val(i);
    x_nodes = (-5 + (10/n) * (0:n)); 
    y_nodes = f(x_nodes);
    
    P_eval = arrayfun(@(x) barycentric_interp(x_nodes, y_nodes, x), y_interv);
    
    errors(i) = max(abs(f_interv - P_eval));
    
    plot(y_interv, P_eval, '-.', 'LineWidth', 2);
end

fprintf("max interpolation errors:\n");
for i = 1:length(n_val)
    fprintf("for n = %d, En: %.6f\n", n_val(i), errors(i));
end

grid on;
hold off;