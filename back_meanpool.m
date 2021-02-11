function [dzdx] = back_meanpool(x,y,dzdy)


dzdx =zeros(size(dzdy,1)*2,size(dzdy,2)*2);
for i = 1:size(y,1)
    for j = 1:size(y,2)
        for k= 1:4
            k1 = floor((k+1)/2)-1;
            k2 = mod(k+1,2);
            dzdx(2*i-1+k1,2*j-1+k2) = 1/4 * dzdy(i,j);
        end
    end
end
end

            