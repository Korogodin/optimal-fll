StratResults = CStratResults(K, 2, T);
StratResults.setP0(minX, maxX, dX, pest0);
% if qcno_dB > 30
    StratResults.setLogMode(1);
% else
%     StratResults.setLogMode(0);
% end
