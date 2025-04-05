x = -1:0.01:3;
x0 = 0;
n = 6;
f = exp(x);

figure
hold on
plot(x,f,'y') %this is the original function

for k=0:n
    Pk = zeros(size(x))

    for m=0:k % here we construct each Taylor polynomial
        Pk = Pk + (x-x0).^m/factorial(m) % because the function is e^x, the function derivated in x0=0 is always 1
        %it could also be Pk=Pk + x.^m/factorial(m) 
    end
    plot(x,Pk,'LineWidth',2)
end


grid on
hold off
