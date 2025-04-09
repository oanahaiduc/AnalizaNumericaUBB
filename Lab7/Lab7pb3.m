figure;
axis([0 3 0 5]); 
title('Click 10 points');
xlabel('x'); ylabel('y');
grid on;

[x, y] = ginput(10);
hold on;
plot(x, y, 'mo', 'MarkerFaceColor', 'm'); 

p = polyfit(x, y, 2);  

x_fit = linspace(0, 3, 1000);         
y_fit = polyval(p, x_fit);          

plot(x_fit, y_fit, 'k-', 'LineWidth', 2);
legend('Selected Points', 'Least Squares Fit (deg 2)', 'Location', 'best');
title('Least Squares Quadratic');
