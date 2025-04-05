x_local = [5, 8, 13];
y_local = [383, 623, 993];
dy = [80, 74, 72];
n_local = length(x_local);

z_local = zeros(1, 2*n_local); %dublurile
Q = zeros(2*n_local, 2*n_local);

for i = 1:n_local
    z_local(2*i-1) = x_local(i);
    z_local(2*i) = x_local(i);
    Q(2*i-1,1) = y_local(i);
    Q(2*i,1)   = y_local(i);
end

for i = 1:n_local
    Q(2*i-1,2) = dy(i);
    if i ~= n_local
        Q(2*i,2) = (Q(2*i+1,1) - Q(2*i,1)) / (z_local(2*i+1) - z_local(2*i));
    else
        Q(2*i,2) = dy(i);
    end
end

for j = 3:2*n_local
    for i = j:2*n_local
        Q(i,j) = (Q(i,j-1) - Q(i-1,j-1)) / (z_local(i) - z_local(i-j+1));
    end
end

%speed in t = 10
dH_local = 0;
t_val = 10;

for k = 1:2*n_local-1
    sum_term = 0;
    for j = 1:k
        partial_product = 1;
        for m = 1:k
            if m ~= j
                partial_product = partial_product * (t_val - z_local(m));
            end
        end
        sum_term = sum_term + partial_product;
    end
    dH_local = dH_local + Q(k+1,k+1) * sum_term;
end

fprintf('estimated pos at t = 10: %.8f m\n', H);

fprintf('estimated speed at t = 10: %.8f m/s\n', dH_local);