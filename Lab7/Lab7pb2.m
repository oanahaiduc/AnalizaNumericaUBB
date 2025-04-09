T = [0 10 20 30 40 60 80 100];
P = [0.0061 0.0123 0.0234 0.0424 0.0738 0.1992 0.4736 1.0133];
T_val = 45;
P_exact = 0.095848;

deg2 = polyfit(T, P, 2);
deg4 = polyfit(T, P, 4);
interp_poly = polyfit(T, P, length(T) - 1); 

P_deg2 = polyval(deg2, T_val);
P_deg4 = polyval(deg4, T_val);
P_interp = polyval(interp_poly, T_val);

err_deg2 = abs(P_deg2 - P_exact);
err_deg4 = abs(P_deg4 - P_exact);
err_interp = abs(P_interp - P_exact);

fprintf('Degree 2 approximation at T = 45: %.6f (error = %.6f)\n', P_deg2, err_deg2);
fprintf('Degree 4 approximation at T = 45: %.6f (error = %.6f)\n', P_deg4, err_deg4);
fprintf('Interpolation polynomial at T = 45: %.6f (error = %.6f)\n', P_interp, err_interp);

T_dense = linspace(0, 100, 500);
P_fit2 = polyval(deg2, T_dense);
P_fit4 = polyval(deg4, T_dense);
P_fit_interp = polyval(interp_poly, T_dense);

figure;
plot(T, P, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(T_dense, P_fit2, 'b--', 'LineWidth', 1.5);
plot(T_dense, P_fit4, 'g-', 'LineWidth', 1.5);
plot(T_dense, P_fit_interp, 'k-.', 'LineWidth', 1.5);
legend('Data Points', 'Degree 2 Fit', 'Degree 4 Fit', 'Interpolation (deg 7)', 'Location', 'northwest');
xlabel('Temperature (°C)');
ylabel('Vapor Pressure (bars)');
title('Least Squares and Interpolation of Vapor Pressure Data');
grid on;
