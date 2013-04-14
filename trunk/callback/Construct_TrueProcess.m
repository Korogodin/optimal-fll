F = [1 T 0
       0 1 T
       0 0 1];
G = [0; 0; 1];
Xs = [0; (maxX(1)+minX(1))/2; (maxX(2)+minX(2))/2];

Xs = F*Xs + G*randn(1,1)*sqrt(Dksi);

Xcorr = [0; 0; 0];