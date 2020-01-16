function [Tpd] = Tpendown(p)

Npd = 0;
T = Ttotal(p);

for i = 1:size(p,2)
    if p(i) ~= 0
        Npd = Npd + 1;
    end
end

Tpd = (Npd/size(p,2))*T;