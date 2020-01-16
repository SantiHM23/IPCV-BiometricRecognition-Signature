function FeatVect = featureExtractor(x,y,p)

%T = Total duration of signature
T = Ttotal(x);
%Npu = Number of times(not samples) that p=0
Npu = Npenups(p);
%Pen-down = p!=0, Td/T
Tpd = Tpendown(p);
%Number of maximums and minimums of signal x
Nmaxx = Nmaxima(x);
%Number of maximums and minimums of signal y
Nmaxy = Nmaxima(y);

FeatVect = [T,Npu,Tpd,Nmaxx,Nmaxy];