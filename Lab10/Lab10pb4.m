% a)
fprintf('a) Conditioning number for t_k = 1/k\n');

for n = 10:15
    t = 1./(1:n); %compute t_k=1\k
    v = vander(t); % face matricea Vandermonde
    c = cond(v); %condition number
     fprintf('n = %d, cond(V) = %e\n', n, c);
end

% b)
fprintf('\nb) Conditioning numbers for t_k = -1 + 2k/n\n');
for n = 10:15
    k = 1:n;
    t = -1+2*k/n; % generate points in [-1,1]
    v = vander(t);
    c = cond(v);
    fprintf('n = %d, cond(V) = %e\n', n, c);
end