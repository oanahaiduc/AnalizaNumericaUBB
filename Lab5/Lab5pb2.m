x=[1 2];
fx=[0 0.6931]; 
fdx=[1 0.5]; % derivatele
z=[1 1 2 2];% dublurile
Q=zeros(4,4);

Q(1,1) = fx(1);
Q(2,1) = fx(1);
Q(3,1) = fx(2);
Q(4,1) = fx(2);

Q(2,2) = fdx(1);
Q(4,2) = fdx(2);
Q(3,2) = (Q(3,1) - Q(2,1)) / (z(3) - z(2));
Q(1,2) = (Q(2,1) - Q(1,1)) / (z(2) - z(1));

for j = 3:4
    for i = j:4
        Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / (z(i) - z(i-j+1));
    end
end

t = 1.5;
H = Q(1,1);
prod_term = 1;
for i = 1:3
    prod_term = prod_term * (t - z(i));
    H = H + Q(i+1,i+1) * prod_term;
end

true_val = log(1.5);
error = abs(true_val - H);

fprintf('interp ln(1.5) = %.7f\n', H);
fprintf('real value = %.7f and absolute error = %.7f\n', true_val, error);