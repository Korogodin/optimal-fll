StatFile.qcno_dB = 1:0.5:50;
StatFile.len_qcno_dB = length(StatFile.qcno_dB);

StatFile.NArgMax = zeros(1, StatFile.len_qcno_dB);
StatFile.NMean = zeros(1, StatFile.len_qcno_dB);
StatFile.NFLL = zeros(1, StatFile.len_qcno_dB);

StatFile.ArgMax= zeros(1, StatFile.len_qcno_dB);
StatFile.Mean = zeros(1, StatFile.len_qcno_dB);
StatFile.FLL = zeros(1, StatFile.len_qcno_dB);

StatFile.FLL_Band = zeros(1, StatFile.len_qcno_dB);
StatFile.FLL_Theor = zeros(1, StatFile.len_qcno_dB);

save('Stat.mat', 'StatFile');