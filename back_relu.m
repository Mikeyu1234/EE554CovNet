function [dzdx] = back_relu(x,y,dzdy)

[m,n]=size(dzdy);   % Set empty dzdy matrix
dydx = zeros(m,n);    
dzdx = zeros(m,n);  

for X = 1:m
    for Y = 1:n     
        if x(X,Y)>0
            dydx(X,Y) =1;
        else
            dydx(X,Y) =0;
        end
        dzdx(X,Y) = dzdy(X,Y) * dydx(X,Y);  
    end
end
