f = @(x) 1 ./ (1 + x.^2);

y_interv = -5:0.01:5;
f_interv = f(y_interv);

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

function poly_str = lagrange_poly(X, Y)
    syms x;
    n = length(X);
    L = sym(zeros(1, n));
    for i = 1:n
        L(i) = 1;
        for j = 1:n
            if i ~= j
                L(i) = L(i) * (x - X(j)) / (X(i) - X(j));
            end
        end
    end
    P = sum(Y .* L);
    poly_str = char(expand(P));
end

n_values = [2, 4, 6, 8];
errors = zeros(size(n_values));

for i = 1:length(n_values)
    n = n_values(i);
    x_nodes = (-5 + (10/n) * (0:n)); 
    y_nodes = f(x_nodes);
    
    P_eval = arrayfun(@(x) barycentric_interp(x_nodes, y_nodes, x), y_interv);
    
    errors(i) = max(abs(f_interv - P_eval));
    
    fprintf("Lagrange polynomial for n = %d:\n%s\n\n", n, lagrange_poly(x_nodes, y_nodes));
end

fprintf("Maximum interpolation errors:\n");
for i = 1:length(n_values)
    fprintf("n = %d, E_n: %.6f\n", n_values(i), errors(i));
end
