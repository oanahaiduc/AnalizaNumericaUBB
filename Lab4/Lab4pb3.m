f = @(x) exp(sin(x));                  
x_nodes = linspace(0, 6, 13); % 13 equidistant points => degree 12 polynomial
y_nodes = f(x_nodes);

n = length(x_nodes);
dd = zeros(n, n);
dd(:,1) = y_nodes';

for j = 2:n
    for i = 1:n-j+1
        dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x_nodes(i+j-1) - x_nodes(i));
    end
end

function p = newton_pol(z, x_nodes, dd)
    n = length(x_nodes);
    p = dd(1,1);
    prod = 1;
    for k = 2:n
        prod = prod * (z - x_nodes(k-1));
        p = p + dd(1,k) * prod;
    end
end


eval = @(x_val) arrayfun(@(z) newton_pol(z, x_nodes, dd), x_val);


xx = linspace(0, 6, 500);
true_vals = f(xx);
aprox_vals = eval(xx);

figure;
plot(xx, true_vals, 'b-', 'LineWidth', 1.5);
hold on;
plot(xx, aprox_vals, 'k--', 'LineWidth', 1.5);
plot(x_nodes, y_nodes, 'mo', 'MarkerFaceColor', 'm');
xlabel('x'); ylabel('y');
grid on;
hold off;
