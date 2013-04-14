% Initial state
dX(1,1) = 0.1 * 2*pi; %
dX(2,1) = sqrt(Dksi) / 3;

HX1 = 2*pi*10;
HX2 = sqrt(Dksi) * 6;

maxX(1,1) = ceil(HX1/dX(1))*dX(1);
maxX(2,1) = ceil(HX2/dX(2))*dX(2);
minX = -maxX;

X1 = minX(1):dX(1):maxX(1);
X2 = minX(2):dX(2):maxX(2);

pest_X1 = 1/HX1 .* ( (X1 >= (-HX1/2))&(X1 <= (HX1/2)) ); % Initial PDs
pest_X2 = 1/HX2 .* ( (X2 >= (-HX2/2))&(X2 <= (HX2/2)) );
pest0 = pest_X1'*pest_X2; % Common PD