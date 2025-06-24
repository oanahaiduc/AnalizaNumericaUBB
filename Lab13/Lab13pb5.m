f = @(x) (x - 2).^2 - log(x);

a = 1;
b = 2;
eps = 1e-4;
N = 100;

a_bis = a; b_bis = b;
for k = 1:N
    c = (a_bis + b_bis)/2;
    fc = f(c);
    if abs(fc) < eps
        break;
    end
    if f(a_bis)*fc < 0
        b_bis = c;
    else
        a_bis = c;
    end
end
fprintf('Bisection root: %.10f after %d iterations\n\n', c, k);


a_fp = a; b_fp = b;
for k = 1:N
    fa = f(a_fp);
    fb = f(b_fp);
    c = (a_fp*fb - b_fp*fa)/(fb - fa);
    fc = f(c);
    if abs(fc) < eps
        break;
    end
    if fa*fc < 0
        b_fp = c;
    else
        a_fp = c;
    end
end
fprintf('False position root: %.10f after %d iterations\n', c, k);
