function plot_Res_ErrorFreqRate(hObject, Kind)
%plot_Res_ErrorFreqRate Plot graphics for errors of freq rate

header; % DO NOT EDIT
global StratResults FLLRes
global TrueValues 

t = TrueValues.t;
plot(hA, t,  [StratResults.ArgMax{2}-TrueValues.X2; StratResults.Mean{2}-TrueValues.X2; FLLRes.X{2}-TrueValues.X2]/2/pi)
title(hA, 'Frequency Rate');
ylabel(hA, '\delta \omega'', Hz/s');
xlabel(hA, 't, sec');
grid(hA, 'on');

footer; % DO NOT EDIT
end
