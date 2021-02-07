
% ymat = forw_conv(xmat, wfilt, bias)
% convolution layer (actually cross-correlation) using zero padding
% xmat is NxM,   wfilt is PxQ,  bias is scalar (1x1)
% output ymat is NxM (same size as xmat)
% ymat = xmat * wfilt + bias  where * is cross-correlation

function ymat = forw_conv(xmat, wfilt, bias)

ymat = bias + imfilter(xmat,wfilt,'corr','same',0);

return

