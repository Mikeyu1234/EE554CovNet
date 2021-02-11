function [dzdx,dzdw,dzdb] = back_fc(x,w,b,y,dzdy)

dzdw = dzdy .* x;
dzdx = dzdy .* w;
dzdb = dzdy;
end
