function [S1, S2] = RandomScanpath_Make(tbin, width, height)

    S1 = struct;
    S2 = struct;
    
    samples = 10; % number of fixations per sample (set by Dewhurst et al.)

    % Sample S1
    x1 = randi([1 width], 1, samples);
    y1 = randi([1 height], 1, samples);
    t1 = randi(tbin, 1, samples);

    % Sample S2
    x2 = randi([1 width], 1, samples);
    y2 = randi([1 height], 1, samples);
    t2 = randi(tbin, 1, samples);
    
    S1.x = x1;
    S1.y = y1;
    S1.t = t1;
    S1.width = width;
    S1.height = height;
    S1.tbin = tbin;
    
    S2.x = x2;
    S2.y = y2;
    S2.t = t2;
    S2.with = width;
    S2.height = height;
    S2.tbin = tbin;
    
    varNames = {'x','y','t','h'};

    h1 = HilbertCurve.from2d(x1, y1);
    S1.table = table(x1',y1',t1',h1','VariableNames', varNames);
    
    h2 = HilbertCurve.from2d(x2, y2);
    S2.table = table(x2',y2',t2',h2','VariableNames', varNames);
    
end



