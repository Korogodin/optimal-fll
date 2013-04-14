    Xs = F*Xs + G*randn(1,1)*sqrt(Dksi);
%     if k < 40
%         Xs(1) = 0;
%         Xs(2) = 0;
%     else
%         Xs(1) = pi/8;
%         Xs(2) = 0;
%     end

    TrueValues.X1(k) = Xs(2);
    TrueValues.X2(k) = Xs(3);
    
    S = A*cos(PW + Xs(2)*tint + Xs(1));
    noise_yes = 1;
    y = S + noise_yes*stdn*randn(1,L); 
