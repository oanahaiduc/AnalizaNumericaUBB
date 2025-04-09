figure;
axis([0 100 0 100]); 
title('click 5 points');
xlabel('x'); ylabel('y');
grid on;

[x, y] = ginput(5);

%sorting the input points
[x, index] = sort(x);
y = y(index);

%cubic natural spline
xx = linspace(min(x), max(x), 1000);
yy = spline(x, y, xx);

%clicked points
plot(x, y, 'mo', 'MarkerSize', 15, 'MarkerFaceColor', 'm'); 
hold on;

%spline curve
plot(xx, yy, 'k', 'LineWidth',2);
legend('Selected Points', 'Cubic Natural Spline');
title('Cubic Natural Spline through 5 Arbitrary Points');
grid on;

