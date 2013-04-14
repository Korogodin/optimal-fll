function erro = process(MW, qcno_dB, Dksi, T)
%PROCESS Start time!
erro = 0;

globals;

Fd = 44.2e3; %Hz
Td = 1/Fd;

stdn = 8e-2;
invstdn2 = (1/stdn)^2;

nx = 2;

K = 200;
L = round(T/Td);

qcno = 10.^(qcno_dB/10);
A = 2*stdn*sqrt(qcno*Td);

initial_PD_script;
Strat = CStrat(T, Dksi, minX, maxX, dX, pest0);
Construct_StratResults;
Construct_TrueProcess;
Construct_TrueValues;

tint = (0:(L-1))*Td;
PW = 2*pi*Fd/3.3712*tint; % Intermediate freq phase
    
t_start = tic;
for k = 1:K
    
    Strat.Extrapolate();
    EvalTrueProcess;
   
    CalcLnL;
    Strat.Observe(lnL);
    StratResults.setLnL(lnL);
    StratResults.takeResults(Strat);
    
    ReplotGraphs;
    if retu
        erro = 1;
        return
    end
end

[nul i] = min(abs(Erro.qcno_dB - qcno_dB));
if nul == 0
        if DoStrat
            Erro.MeanErrPhi_ArgMax(i) = CalcRMS( TrueValues.psi1, TrueValues.psi2, StratResults.ArgMax{1}, StratResults.ArgMax{2}, T, L, K );
            Erro.MeanErrPhi_Mean(i) = CalcRMS( TrueValues.psi1, TrueValues.psi2, StratResults.Mean{1}, StratResults.Mean{2}, T, L, K );
        end
else
    disp('qcno error in process save');
    error;
end
    

end

