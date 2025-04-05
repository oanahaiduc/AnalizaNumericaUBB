x = 0:0.01:1;

l1 = x;
l2 = (3/2) * x.^2 - 1/2;
l3 = (5/2) * x.^3 - (3/2) * x;
l4 = (35/8) * x.^4 - (15/4) * x.^2 + 3/8;

figure

subplot(2,2,1)
plot(x,l1,'r','LineWidth',2)
grid on

subplot(2,2,2)
plot(x,l2,'b','LineWidth',2)
grid on

subplot(2,2,3)
plot(x,l3,'g','LineWidth',2)
grid on


subplot(2,2,4)
plot(x,l4,'m','LineWidth',2)
grid on


%sau cu un for cu k de la 1 la 4 subplot(2,2,k); plot(x,lk)
