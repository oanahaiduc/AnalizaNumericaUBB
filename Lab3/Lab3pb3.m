f = @(x) (1 + cos(pi*x)) ./ (1 + 2*x);

x_nodes = linspace(0, 10, 15);
y_nodes = f(x_nodes);

x_interval = 0:0.01:10
y_interval = f(x_interval);

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

%takes every x from x_ and puts it in barycentric function
y_interp = arrayfun(@(x) barycentric_interp(x_nodes, y_nodes, x), x_interval);

figure;
plot(x_interval, y_interval, 'b', 'LineWidth', 2); 
hold on;
plot(x_interval, y_interp, 'r--', 'LineWidth', 2);
plot(x_nodes, y_nodes, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);
grid on;
hold off;
