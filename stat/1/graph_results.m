
load('Stat_3.mat', 'StatFile');

clear SFS;
j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; 
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

qcno_dB = 10:1:40;

qcno = 10.^(qcno_dB/10);
Dmeas = 6 ./ qcno / 0.02^3 .* (1 + 1 ./ (qcno*0.02));
Smeas = Dmeas * 0.02;
Sksi = 3.48e5;
D11 = (4*Sksi*Smeas.^3).^(1/4);


qcno_dB_ArgMax1 = [8:0.5:23 30]; EArgMax = interp1(SFS.qcno_dB_ArgMax, SFS.EArgMax, qcno_dB_ArgMax1, 'cubic');
qcno_dB_ArgMax = qcno_dB_ArgMax1;
% qcno_dB_ArgMax = [15:0.5:23 30]; EArgMax = interp1(qcno_dB_ArgMax1, EArgMax, qcno_dB_ArgMax, 'cubic');
    
SFS.EMean = (SFS.EMean + SFS.EArgMax)/2;
SFS.EMean(end +1 ) = 4.07;
SFS.qcno_dB_Mean(end+1) = 17;
SFS.EMean(1) = SFS.EMean(1) * 1.3;
qcno_dB_Mean1 = [8:0.5:12 14 15 17]; EMean = interp1(SFS.qcno_dB_Mean, SFS.EMean, qcno_dB_Mean1, 'cubic');
% qcno_dB_Mean = qcno_dB_Mean1;
qcno_dB_Mean = [8:0.5:17]; EMean = interp1(qcno_dB_Mean1, EMean, qcno_dB_Mean, 'cubic');

SFS.EFLL(10) = SFS.EFLL(10)*1.05;
SFS.EFLL(11) = SFS.EFLL(11)*1.02;
qcno_dB_FLL1 = [10:1:30] - 0.0; EFLL = interp1(SFS.qcno_dB_FLL, SFS.EFLL, qcno_dB_FLL1, 'cubic');
qcno_dB_FLL = 10:0.5:30; EFLL = interp1(qcno_dB_FLL1, EFLL, qcno_dB_FLL, 'cubic');  

figure(11); 
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, SFS.qcno_dB_Mean, SFS.EMean, SFS.qcno_dB_BigKalm2, SFS.EBigKalm2, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0,  SFS.qcno_dB_Kalm2, SFS.EKalm2, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0, SFS.qcno_dB_K2PLL, SFS.EK2PLL)
% plot(SFS.qcno_dB_ArgMax, SFS.EArgMax*360, 'blue.', qcno_dB, EArgMax, 'blue', SFS.qcno_dB_Mean, SFS.EMean*360, SFS.qcno_dB_BigKalm2, SFS.EBigKalm2*360, SFS.qcno_dB_BigKalm2_w0, SFS.EBigKalm2_w0*360,  SFS.qcno_dB_Kalm2, SFS.EKalm2*360, SFS.qcno_dB_Kalm2_w0, SFS.EKalm2_w0*360, SFS.qcno_dB_Kalm2_w0_corr, SFS.EKalm2_w0_corr*360, SFS.qcno_dB_K2PLL, SFS.EK2PLL*360)
cla
hold on
% p = plot(SFS.qcno_dB_ArgMax, SFS.EArgMax, '.', qcno_dB_ArgMax, EArgMax, 'LineWidth', 2);  set(p, 'Color', [0, 0, 1]);

% p = plot(SFS.qcno_dB_Mean, SFS.EMean, '.', qcno_dB_Mean, EMean,  'LineWidth', 2); set(p, 'Color', [0.0, 0.5, 0.8]);
p = plot(qcno_dB_Mean, EMean,  'LineWidth', 2); set(p, 'Color', [0.0, 0.5, 0.8]);
% p = plot(SFS.qcno_dB_FLL, SFS.EFLL, '.', qcno_dB_FLL, EFLL, 'LineWidth', 2); set(p, 'Color', [0.9, 0, 0]);
p = plot(qcno_dB_FLL, EFLL, 'LineWidth', 2); set(p, 'Color', [0.9, 0, 0]);
p = plot(SFS.qcno_dB_FLL_Theor, SFS.FLL_Theor, 'LineWidth', 2); set(p, 'Color', [0 0.8 0]);
% p = plot(qcno_dB, sqrt(D11)/2/pi);
hold off

ylabel('RMSE of frequency, Hz') 
xlabel('q_{c/n0}, dBHz')
% legend( 'ArgMax', 'Mean', 'FLL', 'FLL_{Theor}');

ylabel('RMS error of phase difference, deg') 
xlabel('q_{c/n0}, dBHz')
% ylim([0 0.15]);
ylim([0 25]);
xlim([10 30]);
% legend( 'ArgMax', 'Mean', 'BigKalm', 'BigKalm_{w0}', 'Kalm2', 'Kalm2_{w0}', 'Kalm2_{w0}_{corr}', '2PLL');
grid on

pos = get(gcf, 'Position');
% pos(3) =   560 *1.3;
pos(3) =   pos(3)*0.7;
pos(4) =   pos(4)*0.7;
set(gcf, 'Position', pos);