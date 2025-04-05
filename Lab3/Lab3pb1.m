years = [1940 1950 1955 1960 1970 1980];
population = [122201 132670 150646 179300 202210 224505];

function P = barycentric_form(X, Y, x)
    n = length(X);
    w = ones(1,n);

    for j = 1:n  %compute the weights k!=j
        for k = [1:j-1,j+1:n]
            w(j) = w(j) /(X(j) - X(k));
        end
    end

    num = 0;
    den = 0;

    for j = 1:n  %If x is already in years it returns the value Y(j)->from population
        if x == X(j) 
            P = Y(j);
            return;
        end
        term = w(j) / (x - X(j));
        num = num + term * Y(j); 
        den = den + term;
    end

    P = num/den;
end

pop_interp = barycentric_form(years, population, 1965);
pop_extarp = barycentric_form(years, population, 1990);

fprintf("Approx population in 1965: %.0f thousand\n", pop_interp)
fprintf("Approx population in 1990: %.0f thousand\n", pop_extarp)

       
        
     