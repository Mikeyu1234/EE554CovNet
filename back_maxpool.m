function [dzdx] = back_maxpool(x,y,dzdy)

[m,n] = size(y);	
dzdx = zeros(2*m,2*n); %set empty matrix

for i = 1:m
    for j =1:n
        for k1 = 0:1
            for k2= 0:1
                y2(2*i-k1,2*j-k2)=y(i,j);
                if y2(2*i-k1,2*j-k2)==x(2*i-k1,2*j-k2)
                    dzdx(2*i-k1,2*j-k2)=dzdy(i,j);
                end
            end
        end
    end
end
end

