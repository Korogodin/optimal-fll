function plot_Res_FreqRate(hObject, Kind)
%plot_Res_PhaseDiffRate Plot graphics for phase diffenerece rate and its estimations

header; % DO NOT EDIT

global StratResults FLLRes
global TrueValues 

t = TrueValues.t;
plot(hA, t,  [StratResults.ArgMax{2}; StratResults.Mean{2}; FLLRes.X{2}; TrueValues.X2]/2/pi)
title(hA, 'Frequency Rate');
ylabel(hA, '\omega'', Hz/s');
xlabel(hA, 't, sec');
grid(hA, 'on');

footer; % DO NOT EDIT
end