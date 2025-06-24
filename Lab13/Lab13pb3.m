f = @(E) E - 0.8*sin(E) - 2*pi/10;
df = @(E) 1 - 0.8*cos(E);

E = 1;

fprintf('Newton iterations for Kepler’s Equation:\n');
for k = 1:6
    E_new = E - f(E)/df(E);
    fprintf('E_%d = %.12f\n', k, E_new);
    E = E_new;
end
