x = [1, 2, 3, 4, 5];
y = [22, 23, 25, 30, 28];

n = length(x);
dd = zeros(n,n);
dd(:,1) = y';

for j = 2:n
    for i = 1:n-j+1
        dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x(i+j-1) - x(i));
    end
end

newton_pol = @(val) dd(1,1) + ...
    dd(1,2)*(val - x(1)) + ...
    dd(1,3)*(val - x(1))*(val - x(2)) + ...
    dd(1,4)*(val - x(1))*(val - x(2))*(val - x(3)) + ...
    dd(1,5)*(val - x(1))*(val - x(2))*(val - x(3))*(val - x(4));

% a) yield at 2.5 pounds of fertilizer
valForYield = newton_pol(2.5);
fprintf('Estimated yield at x = 2.5: %.2f pounds\n', valForYield);

% b) 
xx = linspace(1, 5, 100);
yy = arrayfun(newton_pol, xx);

figure;
plot(x, y, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Data Points');
hold on;
plot(xx, yy, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Newton Interpolation');
grid on;
xlabel('Fertilizer (pounds)');
ylabel('Yield (pounds)');
hold off;
