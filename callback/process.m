function erro = process(MW, qcno_dB, Dksi, T)
%PROCESS Start time!
erro = 0;

globals;

Fd = 413 /T; %Hz (L/T)
Td = 1/Fd;

stdn = 8e-2;
invstdn2 = (1/stdn)^2;

nx = 2;

K = 2000; % Tmod/T
L = round(T/Td);

qcno = 10.^(qcno_dB/10);
A = 2*stdn*sqrt(qcno*Td);

initial_PD;
Strat = CStrat(T, Dksi, minX, maxX, dX, pest0);
Construct_StratResults;
Construct_TrueProcess;
Construct_TrueValues;
Construct_FLL; 

tint = (0:(L-1))*Td;
PW = 2*pi*Fd/3.3712*tint; % Intermediate freq phase
    
t_start = tic;
for k = 1:K
    
    if DoStrat
        Strat.Extrapolate();
    end
    if DoFLL
        FLL.Extrapolate();
    end
    
        EvalTrueProcess;
   
    if DoStrat
        CalcLnL;
        Strat.Observe(lnL);
        StratResults.setLnL(lnL);
        StratResults.takeResults(Strat);
    end
    if DoFLL
        CalcUd;
        FLL.Estimate(ud);
        mX = FLL.getXest();
        FLLRes.X{1}(k) = mX(1);
        FLLRes.X{2}(k) = mX(2);
        FLLRes.Band = FLL.Band;
    end
    
    ReplotGraphs;
    if retu
        erro = 1;
        return
    end
end

[nul i] = min(abs(Erro.qcno_dB - qcno_dB));
if nul == 0
        if DoStrat
            Erro.RMSE_X1_ArgMax(i) = sqrt(mean((TrueValues.X1 - StratResults.ArgMax{1}).^2)) / 2/pi;
            Erro.RMSE_X1_Mean(i) = sqrt(mean((TrueValues.X1 - StratResults.Mean{1}).^2)) / 2/pi;
        end
        if DoFLL
            Erro.RMSE_X1_FLL(i) = sqrt(mean((TrueValues.X1 - FLLRes.X{1}).^2)) / 2/pi;
            Erro.RMSE_X1_FLL_Theor(i) = sqrt(DKest(1,1))/2/pi;
            Erro.FLL_Band(i) = FLLRes.Band;
        end
else
    disp('qcno error in process save');
    error;
end
    

end

