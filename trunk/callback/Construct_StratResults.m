StratResults = CStratResults(K, 2, T);
StratResults.setP0(minX, maxX(1:2), dX(1:2), pest0);
% if qcno_dB > 30
    StratResults.setLogMode(1);
% else
%     StratResults.setLogMode(0);
% end
