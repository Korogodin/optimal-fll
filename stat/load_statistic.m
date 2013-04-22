
try
    load('../Stat.mat', 'StatFile');
end
try
    load('Stat.mat', 'StatFile');
end


clear SFS;
j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; j6 = 0; j7 = 0; j8 =0; j9 =0; j10 =0;  j11 =0; 
for i = 1:StatFile.len_qcno_dB

    if StatFile.NArgMax(i) > 0
        j1 = j1+ 1;
        SFS.qcno_dB_ArgMax(j1) = StatFile.qcno_dB(i);
        SFS.EArgMax(j1) = StatFile.ArgMax(i) / StatFile.NArgMax(i);
    end
    
    if StatFile.NMean(i) > 0
        j2 = j2 + 1;
        SFS.qcno_dB_Mean(j2) = StatFile.qcno_dB(i);
        SFS.EMean(j2) = StatFile.Mean(i) / StatFile.NMean(i);
    end
    
    if StatFile.NFLL(i) > 0
        j3 = j3 + 1;
        SFS.qcno_dB_FLL(j3) = StatFile.qcno_dB(i);
        SFS.EFLL(j3) = StatFile.FLL(i) / StatFile.NFLL(i);
    end    
    
    if StatFile.FLL_Band(i) > 0
        j4 = j4 + 1;
        SFS.qcno_dB_FLL_Band(j4) = StatFile.qcno_dB(i);
        SFS.FLL_Band(j4) = StatFile.FLL_Band(i);
    end         
    
    if StatFile.FLL_Band(i) > 0
        j5 = j5 + 1;
        SFS.qcno_dB_FLL_Theor(j5) = StatFile.qcno_dB(i);
        SFS.FLL_Theor(j5) = StatFile.FLL_Theor(i);
    end      
    
end


% figure(8)
% [AX, H1, H2] = plotyy(SFS.qcno_dB_Kalm, SFS.EKalm, SFS.qcno_dB_KalmBand, SFS.KalmBand);
% set(get(AX(1),'Ylabel'),'String','RMS error of phase difference, cycles') 
% set(get(AX(2),'Ylabel'),'String','Band, Hz') 
% xlabel('q_{c/n0}, dBHz')

figure(10);
plot(SFS.qcno_dB_FLL_Band, SFS.FLL_Band)
xlabel('q_{c/n0}, dBHz')
ylabel('Band, Hz');
grid on

qcno = 10.^(SFS.qcno_dB_FLL_Theor/10);
Dmeas = 6 ./ qcno / 0.02^3 .* (1 + 1 ./ (qcno*0.02));
Smeas = Dmeas * 0.02;
Sksi = 217.8;
D11 = (4*Sksi*Smeas.^3).^(1/4);


% figure(11)
% plot(SFS.qcno_dB_FLL, SFS.EFLL, SFS.qcno_dB_FLL_Theor, SFS.FLL_Theor, SFS.qcno_dB_FLL_Theor, sqrt(D11)/2/pi)
% ylabel('RMSE of frequency, Hz') 
% xlabel('q_{c/n0}, dBHz')
% legend('FLL', 'FLL_{Theor}', 'FLL_{Theor, Analog}');
% grid on
% ylim([0 25])

figure(12)
plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_FLL, SFS.EFLL, SFS.qcno_dB_FLL_Theor, SFS.FLL_Theor)
ylabel('RMSE of frequency, Hz') 
xlabel('q_{c/n0}, dBHz')
legend( 'ArgMax', 'Mean', 'FLL', 'FLL_{Theor}');
grid on
ylim([0 25]);
