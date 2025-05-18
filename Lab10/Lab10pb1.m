% a)
A = [400 -201; -800 401];
B = [200; -200];

% A * x = B
x=A\B; 
disp('a) ');
disp(x)

% b)
A_mod = [401 -201; -800 401];
x_mod = A_mod\B; %A_mod * x_mod = B
disp('b) ');
disp(x_mod)

% c)
cond_A = cond(A);
disp('Conditioning number of matrix A: ');
disp(cond_A)