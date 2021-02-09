function [maxele] = forw_fc(xmat,wfilt,bias)
maxele=0;
for x=1:(size(xmat,1)) %iterate x
    for y=1:(size(xmat,2))%iterate y

        maxele=maxele+xmat(x,y)*wfilt(x,y);%relu
    end
end
maxele=maxele+bias;

return
