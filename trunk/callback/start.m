function start( MW )

globals;

qcno_dB = 45;

T = 0.02;

Sksi = 3.48e5;
Dksi = Sksi * T;

for n = 1:1
    for i = 1:length(qcno_dB)
 
        erro = process(MW, qcno_dB(i), Dksi, T);
        if erro 
            return;
        end
        
    end
%     save_statistic;
end



end


