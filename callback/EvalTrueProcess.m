    if 1
        Xs = F*Xs + G*randn(1,1)*sqrt(Dksi);
    else
        if k < 80
            Xs(2) = 0;
            Xs(3) = 0;
        else
            Xs(2) = 2*pi * 600;
            Xs(3) = 0;
        end
        Xs(1) = Xs(1) + Xs(2)*T;
    end
    
    TrueValues.X1(k) = Xs(2);
    TrueValues.X2(k) = Xs(3);
    TrueValues.k = k;
    S = A*cos(PW + Xs(2)*tint + Xs(1));
    noise_yes = 1;
    y = S + noise_yes*stdn*randn(1,L); 
