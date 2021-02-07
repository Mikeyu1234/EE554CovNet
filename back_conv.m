% [dzdx, dzdw, dzdb] = back_conv(xmat, wfilt, bias, ymat, dzdy)
% convolution layer (actually cross-correlation) using zero padding
% xmat is NxM,   wfilt is PxQ,  bias is scalar (1x1)
% ymat is NxM and is xmat * wfilt + bias  where * is cross-correlation
% note, ymat should be the output computed by forw_conv in forward pass
% dzdy is NxM and is matrix of derivatives of loss function z with respect
% to each of the elements of ymat, e.g. dzdy(i,j) = dz / dy(i,j)

function [dzdx, dzdw, dzdb] = back_conv(xmat, wfilt, bias, ymat, dzdy)

%do zero padding of xmat 
zpadx = zeros(size(xmat,1)+size(wfilt,1)-1,size(xmat,2)+size(wfilt,2)-1);
rr = ceil(size(wfilt,1)/2);
cc = ceil(size(wfilt,2)/2);
zpadx((rr+(1:size(xmat,1))-1),cc+(1:size(xmat,2))-1) = xmat;

%compute derivatives with respect to elements of wfilt
%use convolution matrix M such that vecy = M * vec(wfilt) + b where * is
%matrix multiply 

M = im2col(zpadx,size(wfilt),'sliding')';
dzdw = reshape(M' * dzdy(:), size(wfilt));

%compute derivatives with respect to elements of xmat
%use convolution matrix M such that vecy = M * vec(xmat) + b where * is
%matrix multiply.  This is a block toeplitz matrix, but I'm going to be
%lazy and compute it a slow, exhaustive way by putting the filter in all
%2D locations one-by-one and reading that out as the next row of M
M = zeros(prod(size(ymat)),prod(size(xmat)));
tmpmat = zeros(size(zpadx));
tmpmat(1:size(wfilt,1),1:size(wfilt,2)) = wfilt;
i = 1;
for c=1:size(ymat,2)
    for r=1:size(ymat,1)
        tmp = circshift(tmpmat,[r-1,c-1]);
        %take only unpadded portion
        tmp = tmp((rr+(1:size(xmat,1))-1),cc+(1:size(xmat,2))-1);
        M(i,:) = tmp(:)';
        i = i + 1;  
    end
end
dzdx = reshape(M' * dzdy(:), size(xmat));

%compute derivatives with respect to scalar bias b. This is easy since
%all derivs dYpq/db are 1 (since we are just adding b after convolution).
%Therefore this simplifies to adding up the values of array dzdy.
dzdb = sum(dzdy(:));

return


