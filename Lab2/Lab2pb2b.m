x = -1:0.01:1;
n = 6;

T0 = ones(size(x))
T1 = x;

figure 
hold on
plot(x,T0,'LineWidth',2);
plot(x,T1,'LineWidth',2);

for k = 2:n
    Tk = 2*x.*T1-T0;
    plot(x,Tk,'LineWidth',2)

    T0 = T1
    T1 = Tk
end

hold off
grid on