

function [maxele] = forw_maxpool(xmat)
for x=1:(size(xmat,1)/2) %skip a line in x
    for y=1:(size(xmat,2)/2)%skip a line in y

        maxele(x,y)=max(xmat(2*(x)-1:2*x,2*(y)-1:2*y),[],'all');%find max of a 2*2 matrix
    end
end

return
