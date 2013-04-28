function start( MW )

globals;

qcno_dB = 20:3:26;
qcno = 10.^(qcno_dB/10);

T = 0.02;

Sksi = 3.48e5; % sigma_a = 40;
% Sksi = 217.8; % sigma_a = 1;
Dksi = Sksi * T;

DoStrat = 1;
DoFLL = 1;

Erro.qcno_dB = qcno_dB;
Erro.RMSE_X1_ArgMax = nan(1, length(qcno_dB));
Erro.RMSE_X1_Mean = nan(1, length(qcno_dB));
% Erro.RMSE_X1_FLL_Theor = sqrt((4*Dksi/T * (6 ./ qcno / T^3.*(1 + 1 ./ (qcno*T))*T).^3).^(1/4)) / 2/pi; % Theory
Erro.RMSE_X1_FLL_Theor = nan(1, length(qcno_dB));
Erro.RMSE_X1_FLL = nan(1, length(qcno_dB));
Erro.FLL_Band = nan(1, length(qcno_dB));

for n = 1:200
    for i = 1:length(qcno_dB)
 
        erro = process(MW, qcno_dB(i), Dksi, T);
        if erro 
            return;
        end
        
    end
    save_statistic;
end



end


