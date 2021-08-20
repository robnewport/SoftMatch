function S1p = RandomScanpath_Perturb(S1, std)

    S1p = struct;

    W = std * S1.width;
    H = std * S1.height;
    T = std * diff(S1.tbin);

    % Random perturbation is made using normrnd
    % generates a random number from the normal distribution with 
    % mean parameter mu and standard deviation parameter sigma
    % https://au.mathworks.com/help/stats/normrnd.html

    % Sample S1p
    x1p = normrnd(S1.x ,W);
    y1p = normrnd(S1.y, H);
    t1p = normrnd(S1.t, T);
    x1p = min(max(x1p, 1), S1.width); % clip to bounds
    y1p = min(max(y1p, 1), S1.height); % clip to bounds
    
    S1p.x = x1p;
    S1p.y = y1p;
    S1p.t = t1p;
    
    varNames = {'x','y','t','h'};

    h1p = HilbertCurve.from2d(x1p, y1p);
    S1p.table = table(x1p',y1p',t1p',h1p','VariableNames', varNames);

end



