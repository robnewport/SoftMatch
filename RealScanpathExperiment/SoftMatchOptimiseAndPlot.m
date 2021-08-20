names = ["P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" "P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot" "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot"   "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot"  "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot"  "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot"  "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" ];

grids = 18;
delta = (1920*1080)/(grids*grids);

sample_count = 25;
tau_sample_count = 150;

A_names = names(1:53);
B_names = names(54:106);

A_fit = zeros(sample_count, tau_sample_count);
B_fit = zeros(sample_count, tau_sample_count);

stride = 2;

for j = 1:sample_count
    
    % Matches A    
    A = zeros(1, tau_sample_count);
    t = zeros(1, tau_sample_count);
    A_random = randsample(A_names,1);
    B_random = randsample(B_names,1);
        
    parfor i = 1:tau_sample_count

        tau = i * stride;        
        
        cellArray1 = TemporalBinning(readtable(A_random), tau);
        cellArray2 = TemporalBinning(readtable(B_random), tau);

        [matches, distance] = CompareCellArrays(cellArray1, cellArray2, delta)
        A(i) = matches;
        t(i) = tau;
        
    end
    
    A_fit(j,:) = A;
    
    % Matches B
    B = zeros(1, tau_sample_count);
    t = zeros(1, tau_sample_count);
    A_random = randsample(A_names,1);
    B_random = randsample(A_names,1);
        
    parfor i = 1:tau_sample_count

        tau = i * stride;        
                
        cellArray1 = TemporalBinning(readtable(A_random), tau);
        cellArray2 = TemporalBinning(readtable(B_random), tau);
        
        [matches, distance] = CompareCellArrays(cellArray1, cellArray2, delta)
        B(i) = matches;
        t(i) = tau;
        
    end
    
    B_fit(j,:) = B;
    
end

figure;

subplot(2,1,1);

plot(t, A_fit, '-b', 'Color', [0, 0, 1, 0.4]); 
hold on;
plot(t, B_fit, '-r', 'Color', [1, 0, 0, 0.4]); 
L(1) = plot(nan, nan, 'b-');
L(2) = plot(nan, nan, 'r-');
legend(L, {'Convergence vs. Blue Spot','Convergence vs. Convergence'});
xlabel('Tau');
ylabel('Score returned from matches');
plot_title = sprintf('%i random matches, Delta grid size is %i x %i', sample_count * 2, grids, grids);
xlim([2 300]);
title(plot_title);

subplot(2,1,2);

[null_hypo, pScores] = ttest(A_fit, B_fit);
weighted_pScores = pScores ./ t;
plot(t, weighted_pScores,'-b');
[M, I] = min(weighted_pScores);
optimum_tau = I*stride
xline(optimum_tau, '--r',{'Minimum'});
xlabel('Tau (ms)');
ylabel('p-value (t-test)');
plot_title = sprintf('Optimum Tau is %i', optimum_tau);
title(plot_title);

set(gcf,'position',[0,0,400,300]);
f = gcf;
exportgraphics(f,sprintf('delta_%i.jpg', grids),'Resolution',600);

beep()
