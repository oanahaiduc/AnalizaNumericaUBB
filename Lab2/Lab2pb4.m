h = 0.25;
x = 1 + (0:6) * h;
f = @(x)  sqrt(5*x.^2+1); %x is the parameter for function f

f_val = arrayfun(f,x) %applies f to each elem of x
n = length(x);

finite_diff_table = zeros(n,n);
finite_diff_table(:,1)=f_val; %the first column stores the function values

for j=2:n %the table is filled column by column 
    for i =1:n-j+1 ;
        finite_diff_table(i,j) = finite_diff_table(i+1,j-1) - finite_diff_table(i,j-1);
    end
end

disp('finite diff table:')
disp(array2table(finite_diff_table))
