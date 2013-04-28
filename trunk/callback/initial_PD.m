% Initial state
dX(1,1) = 1 * 2*pi; %
dX(2,1) = sqrt(Dksi) / 1.5;

% HX1 = 2*pi*10;
HX1 = 7*dX(1);
% HX2 = sqrt(Dksi) * 1;
HX2 = 15*dX(2);

maxX(1,1) =max([ceil(HX1/dX(1)) 20])*dX(1);
maxX(2,1) = max([ceil(HX2/dX(2)) 20])*dX(2);
minX = -maxX;

X1 = minX(1):dX(1):maxX(1);
X2 = minX(2):dX(2):maxX(2);

pest_X1 = 1/HX1 .* ( (X1 >= (-HX1/2))&(X1 <= (HX1/2)) ); % Initial PDs
pest_X2 = 1/HX2 .* ( (X2 >= (-HX2/2))&(X2 <= (HX2/2)) );
pest0 = pest_X1'*pest_X2; % Common PD