function [tcc, Icc, Sp, Kp, omega] = CTM (data, beta)
    % The function finds the S and Ks from infiltration curve supplied in data
    % Data is a matrix with two column and n rows providing [t, I] 


    I = [];
    t = [];
    t = data(:,1);
    I = data(1:size(t,1), 2); % get the same data for truncated t

    if t(1) == 0
        t = t(2:end,1);
        I = I(2:end,1);
    end

    epsilon = 0.001; % It is an arbitrary value between zero and 0.5 used to adjust omega. Change it to speed up the procedure
    omega = 0.5 + epsilon
    tcc = NaN;
    while isnan(tcc)
        omega = omega - epsilon;
        [tcc, Icc, Sp, Kp] = CTM_Core(I, t, omega, beta);
        if omega <= epsilon
            break;
        end
    end
    
end

function [tcc, Icc, Sp, Kp] = CTM_Core(I, t, omega, beta)
    % Default values
    tcc = NaN;
    Icc = NaN;
    Sp = NaN; 
    Kp = NaN;
    
    %% Calculation
    for j = 1:size(t,1) 
        tc = t(j,1);
        Ic = I(j,1);

        SS = (1-omega)*(Ic/sqrt(tc)); % Compute the preliminary  S
        
        % Compute the preliminary  Ks
        aa = ((beta^2 - beta + 1)* tc^2)/(9*Ic*(1-omega));
        bb = (2-beta)/3 *tc;
        cc = -1*omega*Ic;
        KK = (sqrt(bb^2 - 4*aa*cc)-bb)/(2*aa);

        
        c(1) = SS;
        c(2) = (((2-beta)/3)*KK);
        c(3) = (beta^2 - beta + 1)*((KK^2)/(9*SS));
        c(4) = 2*(beta-2)*(beta+1)*((1-2*beta)/135)*((KK^3)/(SS^2));  

        W = []; W = (c(1).*t.^(1/2))./I; % Compute the share of Sorptivity componant on final infiltration

        d = 0.001; % d (defoult = 0.001) is an arbitrary value between 0 & 1. Change it to increase the flexibility of the procedure
        if max(W) >= 1 - d && max(W) <= 1 + d %
            tcc = t(j,1);
            Icc = I(j,1);
            Sp = (1-omega)*(Icc/sqrt(tcc)); % Compute S using t_grav and I_grav
            
            % Compute the preliminary  Ks
            a1 = ((beta^2 - beta + 1)* tcc^2)/(9*Icc*(1-omega));
            b1 = (2-beta)/3*tcc;
            c1 = -1*omega*Icc;
            Kp = (sqrt(b1^2 - 4*a1*c1)-b1)/(2*a1);
            %             Kp = Icc/tcc*3*omega/(2-beta);
            %               Kp = ((3*omega)/(2-beta))*Icc/tcc;
    

            c(1) = Sp;
            c(2) = (((2-beta)/3)*Kp);
            c(3) = (beta^2 - beta + 1)*((Kp^2)/(9*Sp));
            c(4) = 2*(beta-2)*(beta+1)*((1-2*beta)/135)*((Kp^3)/(Sp^2));  
            break;             
        end
    end
end