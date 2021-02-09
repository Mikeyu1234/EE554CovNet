function [maxele] = forw_relu(xmat)
for x=1:(size(xmat,1)) %iterate x
    for y=1:(size(xmat,2))%iterate y

        maxele(x,y)=max(0,xmat(x,y));%relu
    end
end

return
