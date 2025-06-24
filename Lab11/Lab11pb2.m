A = [6 2 1 -1; 2 4 1 0; 1 1 4 -1; -1 0 -1 3];
b = [8; 7; 5; 1];
n=length(b);
L=eye(n);%eye-creates an nxn identity matrix->lower triangular 
U=zeros(n);%upper triangular

%doolittle decomposition
for i = 1:n
    for k = i:n
        U(i,k) = A(i,k) - L(i,1:i-1)*U(1:i-1,k);
    end
    for k = i+1:n
        L(k,i) = (A(k,i) - L(k,1:i-1)*U(1:i-1,i)) / U(i,i);
    end
end

% L*y=b
y=zeros(n,1);
for i=1:n
    y(i)=b(i)-L(i,1:i-1)*y(1:i-1);
end

% U*x=y
x=zeros(n,1);
for i=n:-1:1
    x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
end
disp('Lower triangular matrix L: ');
disp(L);
disp('Upper triangular matrix U: ');
disp(U);
disp('Solution vector x: ');
disp(x);