%make up some numbers for input array X
X = [ 1 2 4 5; 2 4 1 6; 2 4 0 1;2 2 2 2];
%make up some parameter values for convolution filter and bias
w = [1 3; 2 4];
bias = 3;
%make up some numbers for dz/dY coming in from backprop 
dzdy = [-2 4; 3 1];

%our job is to compute dz/dX, dz/dw and dz/db , both analytically and 
%by numerical derivatives, and compare (should yield same results).

%%
%forward pass to compute Y
Y = forw_meanpool(X);

%computing the backprop derivatives analytically 
dzdx = back_meanpool(X,Y,dzdy);

%%
%now compute them by using numerical derivatives 

% numerically compute dz/dX
eps = 1.0e-6;
dzdxnumeric = zeros(size(X));
Y = forw_meanpool(X);

for i=1:size(X,1)
    for j=1:size(X,2)
        newim = X;
        newim(i,j) = newim(i,j)+eps;       
        yprime = forw_meanpool(newim);       
        deriv = (yprime-Y)/eps;
        %similar to above, deriv = dY/dxij, the deriv of all Y  wrt one xij value
        %we dot product that with deriv of z wrt all Y values, thus 
        %summing over all dz/dypq * dypq/dxij , leaving dz/dxij        
        dzdxnumeric(i,j) = dot(deriv(:),dzdy(:));
    end
end

%%
%we will just compare them by eye
%this could be more fancy, like computing max abs diff between the two
fprintf('comparison of analytic and numerical derivs meanpool backprop\n');
fprintf('comparing dz/dx values\n');
Y
dzdx
dzdxnumeric
