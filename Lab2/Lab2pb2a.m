x = -1:0.01:1;
n = 1:3;

figure
hold on

for k = n
    Tk = cos(k * acos(x));
    plot(x,Tk,'LineWidth',2)
end

grid on
hold off