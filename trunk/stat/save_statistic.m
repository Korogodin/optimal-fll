% load('Stat.mat', 'StatFile');
% 
% StatFile.qcno_dB = 1:0.5:50;
% StatFile.len_qcno_dB = length(StatFile.qcno_dB);
% 
% StatFile.NArgMax = zeros(1, StatFile.len_qcno_dB);
% StatFile.NMean = zeros(1, StatFile.len_qcno_dB);
% StatFile.NFLL = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.ArgMax= zeros(1, StatFile.len_qcno_dB);
% StatFile.Mean = zeros(1, StatFile.len_qcno_dB);
% StatFile.FLL = zeros(1, StatFile.len_qcno_dB);
% 
% StatFile.FLL_Band = zeros(1, StatFile.len_qcno_dB);
% StatFile.FLL_Theor = zeros(1, StatFile.len_qcno_dB);
% 
% save('Stat.mat', 'StatFile');

load('Stat.mat', 'StatFile');
save('StatBackup.mat', 'StatFile');

for i = 1:length(Erro.qcno_dB)
    for j = 1:StatFile.len_qcno_dB
        if Erro.qcno_dB(i) == StatFile.qcno_dB(j)
            
            if DoStrat
                if ~isnan(Erro.RMSE_X1_ArgMax(i))
                    StatFile.NArgMax(j) = StatFile.NArgMax(j) + 1;
                    StatFile.ArgMax(j) = StatFile.ArgMax(j) + Erro.RMSE_X1_ArgMax(i);
                end
                if ~isnan(Erro.RMSE_X1_Mean(i))
                    StatFile.NMean(j) = StatFile.NMean(j) + 1;
                    StatFile.Mean(j) = StatFile.Mean(j) + Erro.RMSE_X1_Mean(i);
                end
            end
            
            if DoFLL
                if ~isnan(Erro.RMSE_X1_FLL(i))
                    StatFile.NFLL(j) = StatFile.NFLL(j) + 1;
                    StatFile.FLL(j) = StatFile.FLL(j) + Erro.RMSE_X1_FLL(i);
                end
                if ~isnan(Erro.FLL_Band(i))
                    StatFile.FLL_Band(j) = Erro.FLL_Band(i);
                end
                if ~isnan(Erro.RMSE_X1_FLL_Theor(i))
                    StatFile.FLL_Theor(j) = Erro.RMSE_X1_FLL_Theor(i);
                end
            end
        end
        
    end
end

save('Stat.mat', 'StatFile')
