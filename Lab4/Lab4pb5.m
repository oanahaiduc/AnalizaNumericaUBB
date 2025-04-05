function P = neville(x_nodes,y_nodes,x_val)
    n=length(x_nodes);
    q=zeros(n,n);
    q(:,1)=y_nodes;
    for j=2:n
        for i = j:n
            q(i,j) = ((x_val -x_nodes(i-j+1)) * q(i,j-1)-...
                (x_val - x_nodes(i))* q(i-1,j-1))/...
                (x_nodes(i) - x_nodes(i-j+1));
        end
    end
    P = q(n,n);
end

%a)
x1 = [-2,-1,0,1,2];
y1 = 3.^x1;
aprox1 = neville(x1, y1, 0.5);
fprintf('f1(x) = 3^x at x = sqrt(3): %.10f\n', aprox1);

%b)
x2 = [0,1,2,4,5];
y2 = sqrt(x2);
aprox2 = neville(x2, y2, 3); 
fprintf('f2(x) = sqrt(x) at x = sqrt(3): %.10f\n', aprox2);