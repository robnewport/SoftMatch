# SoftMatch
Comparing scanpaths using combinatorial spatio-temporal sequences with fractal curves.
 
This code should accompany the paper by the same name and is tested on Matlab R2020b. Three experiments are referenced in the paper and steps to reproduce their findings are below.   

Please set paths in Matlab to the root directory of this repository and include subpaths.

## Data: 
Folder `Data/BlueSpot`   
Folder `Data/Convergence`   
Structure: _x, y, t, h_ represent _x_ fixation position, _y_ fixation position, _t_ fixation duration in milliseconds, and _h_ Hilbert distance, respectively. 

## Experiment 1: Artificial Scanpath Matching Experiment
Inside the folder `RandomScanpathExperiment` open the file `RandomScanpath_Experiment.m` and run it in Matlab.   
Inside the folder `RandomScanpathExperiment` open the file `RandomScanpath_plot.m` and run it in Matlab to see the plot.   
_Please note: Due to the random nature of this experiment, the plot may not be an exact match for the one in the paper._   

## Experiment 2: Real Scanpath Matching Experiment
Inside the folder `RealScanpathExperiment` open the file `SoftMatchOptimiseAndPlot.m` and run it in Matlab.   
This will return optimisation plots for SoftMatch tau and delta parameters.   
_Please note: due to the random nature of this experiment, this plot may not be an exact match for the one in the paper._   

Inside the folder `RealScanpathExperiment` open the file `MultiMatchAnalysis.m` and run it in Matlab.   
This will create heatmaps for MultiMatch.   

Inside the folder `RealScanpathExperiment` open the file `SoftMatchAnalysis.m` and run it in Matlab.   
This will create heatmaps for SoftMatch.   

## MultiMatch
MultiMatch [(Dewhurst et al.)](https://link.springer.com/article/10.3758/s13428-012-0212-2) was kindly provided for this research by Marcus Nyström marcus.nystrom@humlab.lu.se.   
The only change made to MultiMatch was to increase the resolution to 1920 x 1080 on line 8 in file `doComparison.m.`.  
 
