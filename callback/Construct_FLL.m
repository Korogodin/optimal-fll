A_IQ = A*L/2;
Sd_omega = 1/12 * A_IQ^2  * T^2;
F_FLL = [1 T; 0 1];
FLL = CKalmanEqMesConstK([Xs(2); Xs(3)], F_FLL, T);

Sksi = Dksi/T;
Dmeas = 6 / qcno / T^3 * (1 + 1 / (qcno*T));
Smeas = Dmeas * T;

DKest = [2*pi*1 0; 0 5];
for j1 = 1:300
    DKest_new(1,1) = Dmeas * (DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2) ./ (Dmeas + DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2);
    DKest_new(2,1) = Dmeas * (DKest(2,1) + DKest(2,2)*T) ./  (Dmeas + DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2);
    DKest_new(1,2) = DKest(2,1);
    DKest_new(2,2) = (Dmeas*(DKest(2,2) + Dksi) + (DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2)*(DKest(2,2) + Dksi) - (DKest(2,1) + DKest(2,2)*T)^2) ./  (Dmeas + DKest(1,1) + 2*DKest(2,1)*T + DKest(2,2)*T^2);
    DKest = DKest_new;
end
FLL.setKoeff([DKest(1,1); DKest(2,1)] / Dmeas);
% FLL.setKoeffFromSpectr(Sksi, Smeas);
FLL.calcBand();
        
global FLLRes
FLLRes.ud = zeros(1, K);
FLLRes.X = cell(1, nx);
FLLRes.X{1} = nan(1, K);
FLLRes.X{2} = nan(1, K);
FLLRes.ErrX1 = zeros(1, K);
