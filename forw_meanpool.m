function [maxele] = forw_meanpool(xmat)
for x=1:(size(xmat,1)/2)%skip line in x
    for y=1:(size(xmat,2)/2)%skip line in y

        maxele(x,y)=mean(xmat(2*(x)-1:2*x,2*(y)-1:2*y),'all');%find mean of 2*2 mat
    end
end

return
