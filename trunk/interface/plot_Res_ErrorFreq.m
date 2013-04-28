function plot_Res_ErrorFreq(hObject, Kind)
%plot_Res_ErrorPhaseDiff Plot graphics for errors of phase diffenerece

header; % DO NOT EDIT

global StratResults FLLRes
global TrueValues 

t = TrueValues.t;
plot(hA, t,  [StratResults.ArgMax{1}-TrueValues.X1; StratResults.Mean{1}-TrueValues.X1; FLLRes.X{1}-TrueValues.X1]/2/pi)
title(hA, 'Error of frequency estimation');
ylabel(hA, '\delta \omega, Hz');
xlabel(hA, 't, sec');
grid(hA, 'on');

footer; % DO NOT EDIT
end