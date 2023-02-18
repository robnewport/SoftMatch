%% Example SoftMatch lifecycle from preprocess to analysis

%% tau represents the time window in milliseconds
tau = 80;

%% delta represents the quantisation, or the max distance between curves to return a match
grids = 16;
delta = (1920*1080)/(grids*grids);

%% Participant 01 looking it Stimulus 01
P01_S01 = Scanpath_DataPrep2('1014_1_S4 - 1014_1_S4.csv');

%% Participant 02 looking it Stimulus 01
P02_S01 = Scanpath_DataPrep2('1015_1_S4 - 1014_1_S4.csv');

%% Create two cell arrays for input into the comparison function
cellArray1 = TemporalBinning(P01_S01, tau);
cellArray2 = TemporalBinning(P02_S01, tau);

%% Compare the two arrays made above, returns matches using delta, and total distances not using delta
[matches, distance] = CompareCellArrays(cellArray1, cellArray2, delta)
