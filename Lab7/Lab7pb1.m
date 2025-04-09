time = [1 2 3 4 5 6 7];          
temperature = [13 15 20 14 15 13 10]; 

A = [time' ones(length(time), 1)];

coeffs = (A' * A) \ (A' * temperature');

a = coeffs(1);
b = coeffs(2);

predicted_temp_8 = a * 8 + b;

fitted = A * coeffs;
E = sum((fitted - temperature').^2);

fprintf('Least squares line: y = %.3fx + %.3f\n', a, b);
fprintf('Predicted temperature at 8:00: %.2f°C\n', predicted_temp_8);
fprintf('Minimum error E(a, b): %.2f\n', E);

x_vals = 1:0.1:8;
y_fit = a * x_vals + b;

figure;
plot(time, temperature, 'mo', 'MarkerFaceColor', 'm'); hold on;
plot(x_vals, y_fit, 'b-', 'LineWidth', 2);
plot(8, predicted_temp_8, 'ko', 'MarkerFaceColor', 'k');
xlabel('Time (hours)');
ylabel('Temperature (°C)');
title('Least Squares Approximation');
legend('Data Points', 'Best Fit Line', 'Prediction at 8:00', 'Location', 'best');
grid on;
