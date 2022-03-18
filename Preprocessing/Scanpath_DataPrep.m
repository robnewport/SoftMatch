function scanMatchData = Scanpath_DataPrep(participant, stimulus)

% Load a Participant Table and filter for stimulus
filename = 'Favorites - CEPET Seeding Grant 2019 - %s.txt';
filename_concatenated = sprintf(filename, participant);
path = sprintf('%s', filename_concatenated);
T = readtable(path);
            
T = T( contains(T.Stimulus, stimulus, 'IgnoreCase', true) == true,:);

% find all trials with stimulus
trialnames = unique(T.Trial);

    % for each trial in trialnames, make a matrix with x, y, and duration
    for n = 1:length(trialnames)
        trialname = trialnames(n);
        trial = T( contains(T.Trial, trialname, 'IgnoreCase', true) == true,:);
        data = trial(:,["CategoryRight","RecordingTime_ms_","PointOfRegardRightX_px_","PointOfRegardRightY_px_"]);
        data(1,:)=[];
        
        table_size = size(data); 
        rows = table_size(1); 
        
        scanMatchData = [];        
        oldRecordingTime = data.RecordingTime_ms_(1);
        
        for row = 2:rows 
            
            type = data.CategoryRight(row);
                
            if strcmp(type, 'Fixation') && data.PointOfRegardRightX_px_(row) ~= 0 && data.PointOfRegardRightY_px_(row) ~= 0
                newRecordingTime = data.RecordingTime_ms_(row) - oldRecordingTime;
                oldRecordingTime = data.RecordingTime_ms_(row);
                
                x = floor( data.PointOfRegardRightX_px_(row) );
                y = floor( data.PointOfRegardRightY_px_(row) );
                t = newRecordingTime;
                h = HilbertCurve.from2d(x, y);
                
                [testx testy] = HilbertCurve.from1d(h);
                if abs(testx - x) > 1
                    disp('hilbert curve tolerance error: x')
                end
                if abs(testy - y) > 1
                    disp('hilbert curve tolerance error: y')
                end
                
                a = [x y t h];
                
                scanMatchData = [scanMatchData; a];                
            end
        end
    end
end