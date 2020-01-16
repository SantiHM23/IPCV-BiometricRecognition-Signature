function [Nmaxx] = Nmaxima(x)

peaks = findpeaks(x);
Nmaxx = size(peaks,2);
