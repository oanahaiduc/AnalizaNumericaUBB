for n=10:15
    h=hilb(n);
    c=cond(h);
    fprintf('cond h_%d: %e\n',n,c);
end

