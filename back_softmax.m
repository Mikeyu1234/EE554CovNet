function [dzdx] = back_softmax(x,y,dzdy)

dydx = diag(exp(x)) / sum(exp(x))-y*y';
dzdx = dydx * dzdy;
end

