A = [1 1 1 1; 2 3 1 5; -1 1 -5 3; 3 1 7 -2];
b = [10; 31; -2; 18];
n=length(b);

Ab=[A b];
for p=1:n-1
    %gasim pivotul
    [~,q]=max(abs(Ab(p:n,p)));%tilda e folosit pt a ignora primul output din fct max
    q=q+p-1;
    if Ab(q,p) ==0
        error('No unique solution exists.');
    end
    if q~=p
        Ab([p,q],:)=Ab([q,p],:);
    end
    for i=p+1:n
        m=Ab(i,p)/Ab(p,p);
        Ab(i,p:end)=Ab(i,p:end)-m*Ab(p,p:end);
    end
end
if Ab(n,n)==0
    error('No unique solution exists.');
end
x=zeros(n,1);
x(n)=Ab(n,end)/Ab(n,n);
for i=n-1:-1:1
x(i)=(Ab(i,end)-Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
end
disp('Solution vector x: ');
disp(x);