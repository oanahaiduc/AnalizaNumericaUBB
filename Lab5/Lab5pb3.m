f = @(x) sin(2*x);
fd = @(x) 2*cos(2*x); % f derivat

%  15 equidistant nodes
x = linspace(-5, 5, 15);
fx = f(x);
fdx = fd(x);

function H = hermite_eval(x, fx, fdx, t)
    n = length(x);
    z = zeros(1, 2*n);
    Q = zeros(2*n, 2*n);


    for i = 1:n
        z(2*i-1) = x(i);
        z(2*i) = x(i);
        Q(2*i-1, 1) = fx(i);
        Q(2*i, 1) = fx(i);
        Q(2*i, 2) = fdx(i);
        if i ~= 1
            Q(2*i-1, 2) = (Q(2*i-1, 1) - Q(2*i-2, 1)) / (z(2*i-1) - z(2*i-2));
        end
    end

    for j = 3:2*n
        for i = j:2*n
            Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / (z(i) - z(i-j+1));
        end
    end

    % evaluarea polinomului in t 
    H = Q(1,1);
    product_term = 1;
    for i = 1:2*n-1
        product_term = product_term * (t - z(i));
        H = H + Q(i+1, i+1) * product_term;
    end
end


% evaluarea pentru multe multe puncte 
xx = linspace(-5, 5, 1000);
yy = arrayfun(@(t) hermite_eval(x, fx, fdx, t), xx);


figure;
plot(xx, f(xx), 'm', 'LineWidth', 1.5); hold on;
plot(xx, yy, 'k--', 'LineWidth', 1.5);
plot(x, fx, 'ko', 'MarkerFaceColor', '#4DBEEE'); 
legend('f(x) = sin(2x)', 'Hermite Interpolation', 'Interpolation nodes');
title('Hermite Interpolation and f(x) = sin(2x)');
xlabel('x'); ylabel('y');
grid on;