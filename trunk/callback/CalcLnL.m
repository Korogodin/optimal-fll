    X1 = Strat.Xextr{1};
    X2 = Strat.Xextr{2};

    argBessflat = nan(length(X1), 1);
    for j1 = 1:length(X1)
        argSop = (PW + X1(j1)*tint)';
        Sopcos = cos(argSop);
        Sopsin = sin(argSop);
        I = y * Sopcos;
        Q = y * Sopsin;
        argBessflat(j1) = sqrt( I.*I + Q.*Q );
    end
    argBessel = zeros(length(X1), length(X2));
    for j2 = 1:length(X2)
        argBessel(:, j2) = argBessflat;
    end
    argBessel = A*argBessel*invstdn2;
    lnL = argBessel - 0.5*log(argBessel);  