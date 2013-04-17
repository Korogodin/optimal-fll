argSop = (PW + FLL.Xextr(1)*tint + Xcorr(1))';
Xcorr(2) = FLL.Xextr(1); Xcorr(1) = Xcorr(1)  + Xcorr(2)*T;
Sopcos = cos(argSop);
Sopsin = sin(argSop);
I = y * Sopcos;
Q = y * Sopsin;

Ih = - y * (Sopsin.*(1:L)'*Td);
Qh = y * (Sopcos.*(1:L)'*Td);

ud = I*Ih + Q*Qh;

FLLRes.ud(k) = ud;
FLLRes.ErrX1(k) = Xs(2) - FLL.Xextr(1);

ud = ud / Sd_omega;
