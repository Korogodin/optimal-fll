function plot_Res_Freq(hObject, Kind)
%plot_Res_Freq Plot graphics for frequency and its estimations

header; % DO NOT EDIT

global StratResults FLLRes
global TrueValues 

t = TrueValues.t;
plot(hA, t,  [StratResults.ArgMax{1}; StratResults.Mean{1}; FLLRes.X{1}; TrueValues.X1]/2/pi)
title(hA, 'Frequency');
ylabel(hA, '\omega, Hz');
xlabel(hA, 't, sec');
grid(hA, 'on');

legend(hA, 'ArgMax', 'Mean', 'EKF', 'True');

footer; % DO NOT EDIT
end