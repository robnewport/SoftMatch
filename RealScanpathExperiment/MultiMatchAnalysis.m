names = ["P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" "P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot" "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot"   "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot"  "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot"  "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot"  "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" ];
sample_count = length(names);

resultsMultiMatch1 = zeros(106, 106);
resultsMultiMatch2 = zeros(106, 106);
resultsMultiMatch3 = zeros(106, 106);
resultsMultiMatch4 = zeros(106, 106);
resultsMultiMatch5 = zeros(106, 106);

for n = 1:sample_count
    
    rowMultiMatch1 = zeros(1, 106);
    rowMultiMatch2 = zeros(1, 106);
    rowMultiMatch3 = zeros(1, 106);
    rowMultiMatch4 = zeros(1, 106);
    rowMultiMatch5 = zeros(1, 106);
    
    parfor j = 1:sample_count
       
        a = names(n);
        b = names(j);
        
        data1 = readmatrix(sprintf('%s.txt', a));
        data2 = readmatrix(sprintf('%s.txt', b));

        rv = doComparison(data1(2:end,1:3), data2(2:end,1:3));
        
        % Vector similarity = rv(1)
        % Direction similarity = rv(2)
        % Length similarity = rv(3)
        % Position similarity = rv(4)
        % Duration similarity = rv(5)
                
        if isnan(rv)
            MultiMatchValue1 = 0;
            MultiMatchValue2 = 0;
            MultiMatchValue3 = 0;
            MultiMatchValue4 = 0;
            MultiMatchValue5 = 0;
        else
            MultiMatchValue1 = rv(1);
            MultiMatchValue2 = rv(2);
            MultiMatchValue3 = rv(3);
            MultiMatchValue4 = rv(4);
            MultiMatchValue5 = rv(5);
        end
        
        rowMultiMatch1(j) = MultiMatchValue1; 
        rowMultiMatch2(j) = MultiMatchValue2; 
        rowMultiMatch3(j) = MultiMatchValue3; 
        rowMultiMatch4(j) = MultiMatchValue4; 
        rowMultiMatch5(j) = MultiMatchValue5; 
        
    end
    
    resultsMultiMatch1(n,:) = rowMultiMatch1;
    resultsMultiMatch2(n,:) = rowMultiMatch2;
    resultsMultiMatch3(n,:) = rowMultiMatch3;
    resultsMultiMatch4(n,:) = rowMultiMatch4;
    resultsMultiMatch5(n,:) = rowMultiMatch5;
    
end

p = strrep(names,'_',' ');

tiledlayout(2,3);
nexttile;
h1 = heatmap(p, p, resultsMultiMatch1, 'ColorLimits', [0.00 1.00]);
title('MultiMatch Vector');
nexttile;
h2 = heatmap(p, p, resultsMultiMatch2, 'ColorLimits', [0.00 1.00]);
title('MultiMatch Direction');
nexttile;
h3 = heatmap(p, p, resultsMultiMatch3, 'ColorLimits', [0.00 1.00]);
title('MultiMatch Length');
nexttile;
h4 = heatmap(p, p, resultsMultiMatch4, 'ColorLimits', [0.00 1.00]);
title('MultiMatch Position');
nexttile;
h5 = heatmap(p, p, resultsMultiMatch5, 'ColorLimits', [0.00 1.00]);
title('MultiMatch Duration');
set(gcf,'position',[0,0,1920,1080]);

beep()