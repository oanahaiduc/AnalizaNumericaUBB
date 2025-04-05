x_vals = [100 110 120 130 140];
y_vals = sqrt(x_vals);

for k = 1:length(x_vals)-1
    for i = 1:length(x_vals)-k
        y_vals(i) = (y_vals(i) * (x_vals(i+k) - 115) - y_vals(i+1) * (x_vals(i) - 115)) / (x_vals(i+k) - x_vals(i));
    end
end

fprintf('sqrt(115) approx with Aitken : %.7f\n', y_vals(1));