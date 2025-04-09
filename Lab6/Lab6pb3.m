t = [0 3 5 8 13];             %time
s = [0 225 383 623 993];      %distance
v = [75 77 80 74 72];         %speed 

%clamped cubic spline using v end points
spline_coefficients = spline(t, [v(1) s v(end)]);

%position at t = 10s
t_q = 10;
s_at_10 = ppval(spline_coefficients, t_q);  % Predicted distance

%central difference v(t) = [s(t+h)-s(t-h)]/2*h
h = 0.01; 
s_plus = ppval(spline_coefficients, t_q + h);
s_minus = ppval(spline_coefficients, t_q - h);
v_at_10 = (s_plus - s_minus) / (2 * h); 

fprintf('Predicted distance at t = 10s: %.5f feet\n', s_at_10);
fprintf('Predicted speed at t = 10s: %.5f feet/s\n', v_at_10);


tt = linspace(min(t), max(t), 500);
ss = ppval(spline_coefficients, tt);

figure;
plot(t, s, 'mo', 'MarkerSize', 10, 'MarkerFaceColor', 'm'); hold on;
plot(tt, ss, 'k', 'LineWidth', 2);
plot(t_q, s_at_10, 'b*', 'MarkerSize', 20);
legend('Data from table', 'Clamped cubic spline', 'Predicted at t=10');
xlabel('Time (in s)');
ylabel('Distance (in feet)');
title('Clamped cubic spline interpolation for a moving car');
grid on;
