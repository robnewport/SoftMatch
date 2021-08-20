% Define space and time boundary
width = 1920 - 1; % space boundary width
height = 1080 - 1; % space boundary height
tbin = [150 300]; % time boundary, average fixation length is 150 to 300 msec
sigma = [0.1, 0.3, 0.5, 0.7, 0.9]; % noise perturbations
sigma_length = size(sigma, 2);

unique_scanpaths = 24;
perturbation_count = 50;
trialcount = unique_scanpaths * perturbation_count * sigma_length;

sigma_column = zeros(1, trialcount);
softmatch_result_column = zeros(1, trialcount);
multimatch_1_result_column = zeros(1, trialcount);
multimatch_2_result_column = zeros(1, trialcount);
multimatch_3_result_column = zeros(1, trialcount);
multimatch_4_result_column = zeros(1, trialcount);
multimatch_5_result_column = zeros(1, trialcount);


% make 24 unique (S1, S2) pairs.
for i=1:unique_scanpaths    

    [S1, S2] = RandomScanpath_Make(tbin, width, height);
    
    % For each sigma noise perturbation
    for n = 1:sigma_length 
            
        % Perturb S1 50 times
        for p = 1:perturbation_count
            
            noise = sigma(n);
            
            % Noise level
            sigma_column(p) = noise;
            
            % SoftMatch
            S1p = RandomScanpath_Perturb(S1, noise);
            tau = max([max(S1.t) max(S2.t) max(S1p.t)]) ;
            %tau = 1000;
            
            [SoftMatch_similar_score, SoftMatch_similar_distance] = CompareCellArrays(TemporalBinning(S1.table, tau), TemporalBinning(S1p.table, tau), 0) ;
            [SoftMatch_different_score, SoftMatch_different_distance] = CompareCellArrays(TemporalBinning(S1.table, tau), TemporalBinning(S2.table, tau), 0) ;            
            softmatch_result_column(p) = SoftMatch_similar_distance < SoftMatch_different_distance;
            % end SoftMatch
            
            % MultiMatch
            MultiMatch_similar =     doComparison([S1.x; S1.y; S1.t]', [S1p.x; S1p.y; S1p.t]');
            MultiMatch_different =   doComparison([S1.x; S1.y; S1.t]', [S2.x; S2.y; S2.t]');
            multimatch_1_result_column(p) = MultiMatch_similar(1) > MultiMatch_different(1);
            multimatch_2_result_column(p) = MultiMatch_similar(2) > MultiMatch_different(2);
            multimatch_3_result_column(p) = MultiMatch_similar(3) > MultiMatch_different(3);
            multimatch_4_result_column(p) = MultiMatch_similar(4) > MultiMatch_different(4);            
            multimatch_5_result_column(p) = MultiMatch_similar(5) > MultiMatch_different(5);
            % end MultiMatch
        
        end
    end
end


T = table(multimatch_1_result_column', multimatch_2_result_column', multimatch_3_result_column', multimatch_4_result_column', multimatch_5_result_column', softmatch_result_column', sigma_column');
T.Properties.VariableNames = {'MultiMatch_Vector','MultiMatch_Direction','MultiMatch_Length','MultiMatch_Position','MultiMatch_Duration', 'SoftMatch', 'Noise'};
writetable(T,'RandomScanpaths.txt');

beep()


