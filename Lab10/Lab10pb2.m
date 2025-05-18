% a)
A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
B = [32; 23; 33; 31];
x = A\B;
cond_A = cond(A);

disp('a) ');
disp(x);
disp('Conditioning number of A: ');
disp(cond_A);

% b)
b_tilde = [32.1; 22.9; 33.1; 30.9];
x_tilde = A\b_tilde;
input_error = norm(B-b_tilde)/norm(B);
output_error = norm(x-x_tilde)/norm(x);
error_ratio = output_error/input_error;

disp('b) ');
disp(x_tilde);
disp('Input relative error: ');
disp(input_error);
disp('Output relative error: ');
disp(output_error);
disp('Error ratio: ');
disp(error_ratio);

% c)
A_bar = [10 7 8.1 7.2; 7.08 5.04 6 5; 8 5.98 9.89 9; 6.99 4.99 9 9.98];
x_bar = A_bar\B;
input_error_A = norm(A-A_bar)/norm(A);
output_error_x = norm(x-x_bar)/norm(x);
error_ratio_A = output_error_x/input_error_A;

disp('c) ');
disp(x_bar);
disp('Input relative error: ');
disp(input_error_A);
disp('Output relative error: ');
disp(output_error_x);
disp('Error ratio: ');
disp(error_ratio_A);