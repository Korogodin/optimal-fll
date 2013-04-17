function plot_Res_ErrorFreqRate(hObject, Kind)
%plot_Res_ErrorFreqRate Plot graphics for errors of freq rate

header; % DO NOT EDIT

global StratResults
global TrueValues
global FLLRes
t = TrueValues.t*1000;
plot(hA, t, (StratResults.ArgMax{2}-TrueValues.psi2)/2/pi, t,  (StratResults.Mean{2}-TrueValues.psi2)/2/pi,  t,  (BigKRes.X{2}-TrueValues.psi2)/2/pi, t,  (KRes.X{2}-TrueValues.psi2)/2/pi, t,  (Res2PLL.X{2}-TrueValues.psi2)/2/pi)
title(hA, 'Error of phase difference rate estimation');
ylabel(hA, '\psi'', Hz');
xlabel(hA, 't, msec');
grid(hA, 'on');

footer; % DO NOT EDIT
end
