names = ["P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" "P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot" "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot"   "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot"  "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot"  "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot"  "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" ];
sample_count = length(names);

tau = 84; %24; % optimised through SoftMatchOptimiseAndPlot.m
grids = 18; % optimised through SoftMatchOptimiseAndPlot.m
delta = (1920*1080)/(grids*grids);

Scores = zeros(sample_count, sample_count);
Matches = zeros(sample_count, sample_count);
Namemap = strings(sample_count, sample_count);

progress = 0;

for n = 1:sample_count

    score_stride = zeros(1, sample_count);
    match_stride = zeros(1, sample_count);
    namemap_row = strings(1, sample_count);
    
    a = names(n);
    table_a = readtable(a); 
    cellArray1 = TemporalBinning(table_a, tau);
    
    parfor j = 1:sample_count
        
        b = names(j);
        table_b = readtable(b); 
        cellArray2 = TemporalBinning(table_b, tau);

        [matches, scores] = CompareCellArrays(cellArray1, cellArray2, delta);        
        
        score_stride(j) = scores;        
        match_stride(j) = matches;        
        namemap_row(j) = sprintf('%s %s', a, b);
    end
    
    progress = progress + 1;
    displayProgress = progress / sample_count
    
    Scores(n,:) = score_stride;
    Matches(n,:) = match_stride;
    Namemap(n,:) = namemap_row;
    
end

p = strrep(names,'_',' ');
h = heatmap(p, p, Matches, 'ColorLimits', [0.0 10.0]);
plot_title = sprintf('Heatmap: Tau: %i, Delta: %i x %i grid', tau, grids, grids);
title(plot_title);

beep()
