function plot_Stat(hObject, Kind)
%plot_example Example of plot function for axes

header; % DO NOT EDIT

global Erro

plot(Erro.qcno_dB, [Erro.RMSE_X1_ArgMax; Erro.RMSE_X1_Mean; Erro.RMSE_X1_FLL; Erro.RMSE_X1_FLL_Theor]);
legend('ArgMax', 'Mean', 'FLL', 'FLL Theor');
xlabel('q_{c/n0}, dBHz');
ylabel('RMSE of frequency, Hz');

footer; % DO NOT EDIT
end
%EDIT NOT DO

