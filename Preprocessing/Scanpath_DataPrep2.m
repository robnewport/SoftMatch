function scanMatchData = Scanpath_DataPrep2(filename)
    
    %% Detects column types
    opts = detectImportOptions(filename);
    
    T = readtable(filename, opts); 

    %% Pull out the column names you want to use, most importantly time, X, and Y for the dominant eye
    scanMatchData = T(:,["Participant", "Stimulus", "UtcTime", "RightGazePixelX", "RightGazePixelY"]);
    scanMatchData = rmmissing(scanMatchData);

    h = HilbertCurve.from2d(scanMatchData.RightGazePixelX, scanMatchData.RightGazePixelY);
    scanMatchData.h = h;

    %% Format time to extract durations
    scanMatchData.UtcTime = datetime(scanMatchData.UtcTime, 'Format', 'yyyy:MM:dd:HH:mm:ss:SSS:000', 'TimeZone', 'UTC')
    scanMatchData.epochtime = convertTo(scanMatchData.UtcTime, 'epochtime','Epoch','2001-01-01','TicksPerSecond',1000);
    
    %% Extract the changes in duration
    t = scanMatchData.epochtime(2: length(scanMatchData.epochtime) ) - scanMatchData.epochtime(1: length(scanMatchData.epochtime) - 1 );
    t(length(scanMatchData.epochtime)) = 1;
    scanMatchData.t = t;

    %% Format output data
    scanMatchData = scanMatchData(:,["Participant", "Stimulus", "t", "RightGazePixelX", "RightGazePixelY", "h"]);
    scanMatchData.Properties.VariableNames = ["participant", "stimulus", "t", "x", "y", "h"];
    
end
