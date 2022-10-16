function [test_matrix] = test(name_prefix)

tic

% Using Effect Size—or Why the P Value Is Not Enough
% effect size is the magnitude of the difference between groups
% absolute effect size is the difference between the average, or mean, outcomes in two different intervention groups
% According to Cohen, "a medium effect of . 5 is visible to the naked eye of a careful observer.
% https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3444174/

name1  = ["P01_bluepoles" "P02_bluepoles" "P03_bluepoles" "P04_bluepoles" "P05_bluepoles" "P06_bluepoles" "P07_bluepoles" "P08_bluepoles" "P09_bluepoles" "P10_bluepoles"   "P11_bluepoles" "P12_bluepoles" "P13_bluepoles" "P14_bluepoles" "P15_bluepoles" "P16_bluepoles" "P17_bluepoles" "P18_bluepoles" "P19_bluepoles" "P20_bluepoles" "P21_bluepoles" "P22_bluepoles" "P23_bluepoles" "P24_bluepoles" "P25_bluepoles" "P26_bluepoles" "P27_bluepoles" "P28_bluepoles" "P29_bluepoles" "P30_bluepoles" "P31_bluepoles" "P32_bluepoles" "P33_bluepoles" "P34_bluepoles" "P35_bluepoles" "P36_bluepoles" "P37_bluepoles" "P38_bluepoles" "P39_bluepoles" "P40_bluepoles" "P41_bluepoles" "P42_bluepoles" "P43_bluepoles" "P44_bluepoles" "P45_bluepoles" "P46_bluepoles" "P47_bluepoles" "P48_bluepoles" "P49_bluepoles" "P50_bluepoles" "P51_bluepoles" "P52_bluepoles" "P53_bluepoles" "P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot" "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot"   "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot"  "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot"  "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot"  "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" ];
name2  = ["P01_bluepoles" "P02_bluepoles" "P03_bluepoles" "P04_bluepoles" "P05_bluepoles" "P06_bluepoles" "P07_bluepoles" "P08_bluepoles" "P09_bluepoles" "P10_bluepoles"   "P11_bluepoles" "P12_bluepoles" "P13_bluepoles" "P14_bluepoles" "P15_bluepoles" "P16_bluepoles" "P17_bluepoles" "P18_bluepoles" "P19_bluepoles" "P20_bluepoles" "P21_bluepoles" "P22_bluepoles" "P23_bluepoles" "P24_bluepoles" "P25_bluepoles" "P26_bluepoles" "P27_bluepoles" "P28_bluepoles" "P29_bluepoles" "P30_bluepoles" "P31_bluepoles" "P32_bluepoles" "P33_bluepoles" "P34_bluepoles" "P35_bluepoles" "P36_bluepoles" "P37_bluepoles" "P38_bluepoles" "P39_bluepoles" "P40_bluepoles" "P41_bluepoles" "P42_bluepoles" "P43_bluepoles" "P44_bluepoles" "P45_bluepoles" "P46_bluepoles" "P47_bluepoles" "P48_bluepoles" "P49_bluepoles" "P50_bluepoles" "P51_bluepoles" "P52_bluepoles" "P53_bluepoles" "P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" ];
name3  = ["P01_bluepoles" "P02_bluepoles" "P03_bluepoles" "P04_bluepoles" "P05_bluepoles" "P06_bluepoles" "P07_bluepoles" "P08_bluepoles" "P09_bluepoles" "P10_bluepoles"   "P11_bluepoles" "P12_bluepoles" "P13_bluepoles" "P14_bluepoles" "P15_bluepoles" "P16_bluepoles" "P17_bluepoles" "P18_bluepoles" "P19_bluepoles" "P20_bluepoles" "P21_bluepoles" "P22_bluepoles" "P23_bluepoles" "P24_bluepoles" "P25_bluepoles" "P26_bluepoles" "P27_bluepoles" "P28_bluepoles" "P29_bluepoles" "P30_bluepoles" "P31_bluepoles" "P32_bluepoles" "P33_bluepoles" "P34_bluepoles" "P35_bluepoles" "P36_bluepoles" "P37_bluepoles" "P38_bluepoles" "P39_bluepoles" "P40_bluepoles" "P41_bluepoles" "P42_bluepoles" "P43_bluepoles" "P44_bluepoles" "P45_bluepoles" "P46_bluepoles" "P47_bluepoles" "P48_bluepoles" "P49_bluepoles" "P50_bluepoles" "P51_bluepoles" "P52_bluepoles" "P53_bluepoles" "P01_pasiphae" "P02_pasiphae" "P03_pasiphae" "P04_pasiphae" "P05_pasiphae" "P06_pasiphae" "P07_pasiphae" "P08_pasiphae" "P09_pasiphae" "P10_pasiphae" "P11_pasiphae" "P12_pasiphae" "P13_pasiphae" "P14_pasiphae"   "P15_pasiphae" "P16_pasiphae" "P17_pasiphae" "P18_pasiphae" "P19_pasiphae" "P20_pasiphae" "P21_pasiphae" "P22_pasiphae" "P23_pasiphae" "P24_pasiphae"  "P25_pasiphae" "P26_pasiphae" "P27_pasiphae" "P28_pasiphae" "P29_pasiphae" "P30_pasiphae" "P31_pasiphae" "P32_pasiphae" "P33_pasiphae" "P34_pasiphae"  "P35_pasiphae" "P36_pasiphae" "P37_pasiphae" "P38_pasiphae" "P39_pasiphae" "P40_pasiphae" "P41_pasiphae" "P42_pasiphae" "P43_pasiphae" "P44_pasiphae"  "P45_pasiphae" "P46_pasiphae" "P47_pasiphae" "P48_pasiphae" "P49_pasiphae" "P50_pasiphae" "P51_pasiphae" "P52_pasiphae" "P53_pasiphae" ];
name4  = ["P01_bluepoles" "P02_bluepoles" "P03_bluepoles" "P04_bluepoles" "P05_bluepoles" "P06_bluepoles" "P07_bluepoles" "P08_bluepoles" "P09_bluepoles" "P10_bluepoles"   "P11_bluepoles" "P12_bluepoles" "P13_bluepoles" "P14_bluepoles" "P15_bluepoles" "P16_bluepoles" "P17_bluepoles" "P18_bluepoles" "P19_bluepoles" "P20_bluepoles" "P21_bluepoles" "P22_bluepoles" "P23_bluepoles" "P24_bluepoles" "P25_bluepoles" "P26_bluepoles" "P27_bluepoles" "P28_bluepoles" "P29_bluepoles" "P30_bluepoles" "P31_bluepoles" "P32_bluepoles" "P33_bluepoles" "P34_bluepoles" "P35_bluepoles" "P36_bluepoles" "P37_bluepoles" "P38_bluepoles" "P39_bluepoles" "P40_bluepoles" "P41_bluepoles" "P42_bluepoles" "P43_bluepoles" "P44_bluepoles" "P45_bluepoles" "P46_bluepoles" "P47_bluepoles" "P48_bluepoles" "P49_bluepoles" "P50_bluepoles" "P51_bluepoles" "P52_bluepoles" "P53_bluepoles" "P01_starrynight" "P02_starrynight" "P03_starrynight" "P04_starrynight" "P05_starrynight" "P06_starrynight" "P07_starrynight" "P08_starrynight" "P09_starrynight" "P10_starrynight" "P11_starrynight" "P12_starrynight" "P13_starrynight" "P14_starrynight"   "P15_starrynight" "P16_starrynight" "P17_starrynight" "P18_starrynight" "P19_starrynight" "P20_starrynight" "P21_starrynight" "P22_starrynight" "P23_starrynight" "P24_starrynight"  "P25_starrynight" "P26_starrynight" "P27_starrynight" "P28_starrynight" "P29_starrynight" "P30_starrynight" "P31_starrynight" "P32_starrynight" "P33_starrynight" "P34_starrynight"  "P35_starrynight" "P36_starrynight" "P37_starrynight" "P38_starrynight" "P39_starrynight" "P40_starrynight" "P41_starrynight" "P42_starrynight" "P43_starrynight" "P44_starrynight"  "P45_starrynight" "P46_starrynight" "P47_starrynight" "P48_starrynight" "P49_starrynight" "P50_starrynight" "P51_starrynight" "P52_starrynight" "P53_starrynight" ];
name5  = ["P01_bluepoles" "P02_bluepoles" "P03_bluepoles" "P04_bluepoles" "P05_bluepoles" "P06_bluepoles" "P07_bluepoles" "P08_bluepoles" "P09_bluepoles" "P10_bluepoles"   "P11_bluepoles" "P12_bluepoles" "P13_bluepoles" "P14_bluepoles" "P15_bluepoles" "P16_bluepoles" "P17_bluepoles" "P18_bluepoles" "P19_bluepoles" "P20_bluepoles" "P21_bluepoles" "P22_bluepoles" "P23_bluepoles" "P24_bluepoles" "P25_bluepoles" "P26_bluepoles" "P27_bluepoles" "P28_bluepoles" "P29_bluepoles" "P30_bluepoles" "P31_bluepoles" "P32_bluepoles" "P33_bluepoles" "P34_bluepoles" "P35_bluepoles" "P36_bluepoles" "P37_bluepoles" "P38_bluepoles" "P39_bluepoles" "P40_bluepoles" "P41_bluepoles" "P42_bluepoles" "P43_bluepoles" "P44_bluepoles" "P45_bluepoles" "P46_bluepoles" "P47_bluepoles" "P48_bluepoles" "P49_bluepoles" "P50_bluepoles" "P51_bluepoles" "P52_bluepoles" "P53_bluepoles" "P01_turner" "P02_turner" "P03_turner" "P04_turner" "P05_turner" "P06_turner" "P07_turner" "P08_turner" "P09_turner" "P10_turner" "P11_turner" "P12_turner" "P13_turner" "P14_turner"   "P15_turner" "P16_turner" "P17_turner" "P18_turner" "P19_turner" "P20_turner" "P21_turner" "P22_turner" "P23_turner" "P24_turner"  "P25_turner" "P26_turner" "P27_turner" "P28_turner" "P29_turner" "P30_turner" "P31_turner" "P32_turner" "P33_turner" "P34_turner"  "P35_turner" "P36_turner" "P37_turner" "P38_turner" "P39_turner" "P40_turner" "P41_turner" "P42_turner" "P43_turner" "P44_turner"  "P45_turner" "P46_turner" "P47_turner" "P48_turner" "P49_turner" "P50_turner" "P51_turner" "P52_turner" "P53_turner" ];
name6  = ["P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot"   "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot" "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot" "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot" "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot" "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" "P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" ];
name7 = ["P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot"   "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot" "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot" "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot" "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot" "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" "P01_pasiphae" "P02_pasiphae" "P03_pasiphae" "P04_pasiphae" "P05_pasiphae" "P06_pasiphae" "P07_pasiphae" "P08_pasiphae" "P09_pasiphae" "P10_pasiphae" "P11_pasiphae" "P12_pasiphae" "P13_pasiphae" "P14_pasiphae"   "P15_pasiphae" "P16_pasiphae" "P17_pasiphae" "P18_pasiphae" "P19_pasiphae" "P20_pasiphae" "P21_pasiphae" "P22_pasiphae" "P23_pasiphae" "P24_pasiphae"  "P25_pasiphae" "P26_pasiphae" "P27_pasiphae" "P28_pasiphae" "P29_pasiphae" "P30_pasiphae" "P31_pasiphae" "P32_pasiphae" "P33_pasiphae" "P34_pasiphae"  "P35_pasiphae" "P36_pasiphae" "P37_pasiphae" "P38_pasiphae" "P39_pasiphae" "P40_pasiphae" "P41_pasiphae" "P42_pasiphae" "P43_pasiphae" "P44_pasiphae"  "P45_pasiphae" "P46_pasiphae" "P47_pasiphae" "P48_pasiphae" "P49_pasiphae" "P50_pasiphae" "P51_pasiphae" "P52_pasiphae" "P53_pasiphae" ];
name8 = ["P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot"   "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot" "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot" "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot" "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot" "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" "P01_starrynight" "P02_starrynight" "P03_starrynight" "P04_starrynight" "P05_starrynight" "P06_starrynight" "P07_starrynight" "P08_starrynight" "P09_starrynight" "P10_starrynight" "P11_starrynight" "P12_starrynight" "P13_starrynight" "P14_starrynight"   "P15_starrynight" "P16_starrynight" "P17_starrynight" "P18_starrynight" "P19_starrynight" "P20_starrynight" "P21_starrynight" "P22_starrynight" "P23_starrynight" "P24_starrynight"  "P25_starrynight" "P26_starrynight" "P27_starrynight" "P28_starrynight" "P29_starrynight" "P30_starrynight" "P31_starrynight" "P32_starrynight" "P33_starrynight" "P34_starrynight"  "P35_starrynight" "P36_starrynight" "P37_starrynight" "P38_starrynight" "P39_starrynight" "P40_starrynight" "P41_starrynight" "P42_starrynight" "P43_starrynight" "P44_starrynight"  "P45_starrynight" "P46_starrynight" "P47_starrynight" "P48_starrynight" "P49_starrynight" "P50_starrynight" "P51_starrynight" "P52_starrynight" "P53_starrynight" ];
name9 = ["P01_bluespot" "P02_bluespot" "P03_bluespot" "P04_bluespot" "P05_bluespot" "P06_bluespot" "P07_bluespot" "P08_bluespot" "P09_bluespot" "P10_bluespot"   "P11_bluespot" "P12_bluespot" "P13_bluespot" "P14_bluespot" "P15_bluespot" "P16_bluespot" "P17_bluespot" "P18_bluespot" "P19_bluespot" "P20_bluespot" "P21_bluespot" "P22_bluespot" "P23_bluespot" "P24_bluespot" "P25_bluespot" "P26_bluespot" "P27_bluespot" "P28_bluespot" "P29_bluespot" "P30_bluespot" "P31_bluespot" "P32_bluespot" "P33_bluespot" "P34_bluespot" "P35_bluespot" "P36_bluespot" "P37_bluespot" "P38_bluespot" "P39_bluespot" "P40_bluespot" "P41_bluespot" "P42_bluespot" "P43_bluespot" "P44_bluespot" "P45_bluespot" "P46_bluespot" "P47_bluespot" "P48_bluespot" "P49_bluespot" "P50_bluespot" "P51_bluespot" "P52_bluespot" "P53_bluespot" "P01_turner" "P02_turner" "P03_turner" "P04_turner" "P05_turner" "P06_turner" "P07_turner" "P08_turner" "P09_turner" "P10_turner" "P11_turner" "P12_turner" "P13_turner" "P14_turner"   "P15_turner" "P16_turner" "P17_turner" "P18_turner" "P19_turner" "P20_turner" "P21_turner" "P22_turner" "P23_turner" "P24_turner"  "P25_turner" "P26_turner" "P27_turner" "P28_turner" "P29_turner" "P30_turner" "P31_turner" "P32_turner" "P33_turner" "P34_turner"  "P35_turner" "P36_turner" "P37_turner" "P38_turner" "P39_turner" "P40_turner" "P41_turner" "P42_turner" "P43_turner" "P44_turner"  "P45_turner" "P46_turner" "P47_turner" "P48_turner" "P49_turner" "P50_turner" "P51_turner" "P52_turner" "P53_turner" ];
name10 = ["P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" "P01_pasiphae" "P02_pasiphae" "P03_pasiphae" "P04_pasiphae" "P05_pasiphae" "P06_pasiphae" "P07_pasiphae" "P08_pasiphae" "P09_pasiphae" "P10_pasiphae" "P11_pasiphae" "P12_pasiphae" "P13_pasiphae" "P14_pasiphae"   "P15_pasiphae" "P16_pasiphae" "P17_pasiphae" "P18_pasiphae" "P19_pasiphae" "P20_pasiphae" "P21_pasiphae" "P22_pasiphae" "P23_pasiphae" "P24_pasiphae"  "P25_pasiphae" "P26_pasiphae" "P27_pasiphae" "P28_pasiphae" "P29_pasiphae" "P30_pasiphae" "P31_pasiphae" "P32_pasiphae" "P33_pasiphae" "P34_pasiphae"  "P35_pasiphae" "P36_pasiphae" "P37_pasiphae" "P38_pasiphae" "P39_pasiphae" "P40_pasiphae" "P41_pasiphae" "P42_pasiphae" "P43_pasiphae" "P44_pasiphae"  "P45_pasiphae" "P46_pasiphae" "P47_pasiphae" "P48_pasiphae" "P49_pasiphae" "P50_pasiphae" "P51_pasiphae" "P52_pasiphae" "P53_pasiphae" ];
name11 = ["P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" "P01_starrynight" "P02_starrynight" "P03_starrynight" "P04_starrynight" "P05_starrynight" "P06_starrynight" "P07_starrynight" "P08_starrynight" "P09_starrynight" "P10_starrynight" "P11_starrynight" "P12_starrynight" "P13_starrynight" "P14_starrynight"   "P15_starrynight" "P16_starrynight" "P17_starrynight" "P18_starrynight" "P19_starrynight" "P20_starrynight" "P21_starrynight" "P22_starrynight" "P23_starrynight" "P24_starrynight"  "P25_starrynight" "P26_starrynight" "P27_starrynight" "P28_starrynight" "P29_starrynight" "P30_starrynight" "P31_starrynight" "P32_starrynight" "P33_starrynight" "P34_starrynight"  "P35_starrynight" "P36_starrynight" "P37_starrynight" "P38_starrynight" "P39_starrynight" "P40_starrynight" "P41_starrynight" "P42_starrynight" "P43_starrynight" "P44_starrynight"  "P45_starrynight" "P46_starrynight" "P47_starrynight" "P48_starrynight" "P49_starrynight" "P50_starrynight" "P51_starrynight" "P52_starrynight" "P53_starrynight" ];
name12 = ["P01_convergence" "P02_convergence" "P03_convergence" "P04_convergence" "P05_convergence" "P06_convergence" "P07_convergence" "P08_convergence" "P09_convergence" "P10_convergence"   "P11_convergence" "P12_convergence" "P13_convergence" "P14_convergence" "P15_convergence" "P16_convergence" "P17_convergence" "P18_convergence" "P19_convergence" "P20_convergence" "P21_convergence" "P22_convergence" "P23_convergence" "P24_convergence" "P25_convergence" "P26_convergence" "P27_convergence" "P28_convergence" "P29_convergence" "P30_convergence" "P31_convergence" "P32_convergence" "P33_convergence" "P34_convergence" "P35_convergence" "P36_convergence" "P37_convergence" "P38_convergence" "P39_convergence" "P40_convergence" "P41_convergence" "P42_convergence" "P43_convergence" "P44_convergence" "P45_convergence" "P46_convergence" "P47_convergence" "P48_convergence" "P49_convergence" "P50_convergence" "P51_convergence" "P52_convergence" "P53_convergence" "P01_turner" "P02_turner" "P03_turner" "P04_turner" "P05_turner" "P06_turner" "P07_turner" "P08_turner" "P09_turner" "P10_turner" "P11_turner" "P12_turner" "P13_turner" "P14_turner"   "P15_turner" "P16_turner" "P17_turner" "P18_turner" "P19_turner" "P20_turner" "P21_turner" "P22_turner" "P23_turner" "P24_turner"  "P25_turner" "P26_turner" "P27_turner" "P28_turner" "P29_turner" "P30_turner" "P31_turner" "P32_turner" "P33_turner" "P34_turner"  "P35_turner" "P36_turner" "P37_turner" "P38_turner" "P39_turner" "P40_turner" "P41_turner" "P42_turner" "P43_turner" "P44_turner"  "P45_turner" "P46_turner" "P47_turner" "P48_turner" "P49_turner" "P50_turner" "P51_turner" "P52_turner" "P53_turner" ];
name13  = ["P01_pasiphae" "P02_pasiphae" "P03_pasiphae" "P04_pasiphae" "P05_pasiphae" "P06_pasiphae" "P07_pasiphae" "P08_pasiphae" "P09_pasiphae" "P10_pasiphae"   "P11_pasiphae" "P12_pasiphae" "P13_pasiphae" "P14_pasiphae" "P15_pasiphae" "P16_pasiphae" "P17_pasiphae" "P18_pasiphae" "P19_pasiphae" "P20_pasiphae" "P21_pasiphae" "P22_pasiphae" "P23_pasiphae" "P24_pasiphae" "P25_pasiphae" "P26_pasiphae" "P27_pasiphae" "P28_pasiphae" "P29_pasiphae" "P30_pasiphae" "P31_pasiphae" "P32_pasiphae" "P33_pasiphae" "P34_pasiphae" "P35_pasiphae" "P36_pasiphae" "P37_pasiphae" "P38_pasiphae" "P39_pasiphae" "P40_pasiphae" "P41_pasiphae" "P42_pasiphae" "P43_pasiphae" "P44_pasiphae" "P45_pasiphae" "P46_pasiphae" "P47_pasiphae" "P48_pasiphae" "P49_pasiphae" "P50_pasiphae" "P51_pasiphae" "P52_pasiphae" "P53_pasiphae" "P01_starrynight" "P02_starrynight" "P03_starrynight" "P04_starrynight" "P05_starrynight" "P06_starrynight" "P07_starrynight" "P08_starrynight" "P09_starrynight" "P10_starrynight" "P11_starrynight" "P12_starrynight" "P13_starrynight" "P14_starrynight"   "P15_starrynight" "P16_starrynight" "P17_starrynight" "P18_starrynight" "P19_starrynight" "P20_starrynight" "P21_starrynight" "P22_starrynight" "P23_starrynight" "P24_starrynight"  "P25_starrynight" "P26_starrynight" "P27_starrynight" "P28_starrynight" "P29_starrynight" "P30_starrynight" "P31_starrynight" "P32_starrynight" "P33_starrynight" "P34_starrynight"  "P35_starrynight" "P36_starrynight" "P37_starrynight" "P38_starrynight" "P39_starrynight" "P40_starrynight" "P41_starrynight" "P42_starrynight" "P43_starrynight" "P44_starrynight"  "P45_starrynight" "P46_starrynight" "P47_starrynight" "P48_starrynight" "P49_starrynight" "P50_starrynight" "P51_starrynight" "P52_starrynight" "P53_starrynight" ];
name14  = ["P01_pasiphae" "P02_pasiphae" "P03_pasiphae" "P04_pasiphae" "P05_pasiphae" "P06_pasiphae" "P07_pasiphae" "P08_pasiphae" "P09_pasiphae" "P10_pasiphae"   "P11_pasiphae" "P12_pasiphae" "P13_pasiphae" "P14_pasiphae" "P15_pasiphae" "P16_pasiphae" "P17_pasiphae" "P18_pasiphae" "P19_pasiphae" "P20_pasiphae" "P21_pasiphae" "P22_pasiphae" "P23_pasiphae" "P24_pasiphae" "P25_pasiphae" "P26_pasiphae" "P27_pasiphae" "P28_pasiphae" "P29_pasiphae" "P30_pasiphae" "P31_pasiphae" "P32_pasiphae" "P33_pasiphae" "P34_pasiphae" "P35_pasiphae" "P36_pasiphae" "P37_pasiphae" "P38_pasiphae" "P39_pasiphae" "P40_pasiphae" "P41_pasiphae" "P42_pasiphae" "P43_pasiphae" "P44_pasiphae" "P45_pasiphae" "P46_pasiphae" "P47_pasiphae" "P48_pasiphae" "P49_pasiphae" "P50_pasiphae" "P51_pasiphae" "P52_pasiphae" "P53_pasiphae" "P01_turner" "P02_turner" "P03_turner" "P04_turner" "P05_turner" "P06_turner" "P07_turner" "P08_turner" "P09_turner" "P10_turner" "P11_turner" "P12_turner" "P13_turner" "P14_turner"   "P15_turner" "P16_turner" "P17_turner" "P18_turner" "P19_turner" "P20_turner" "P21_turner" "P22_turner" "P23_turner" "P24_turner"  "P25_turner" "P26_turner" "P27_turner" "P28_turner" "P29_turner" "P30_turner" "P31_turner" "P32_turner" "P33_turner" "P34_turner"  "P35_turner" "P36_turner" "P37_turner" "P38_turner" "P39_turner" "P40_turner" "P41_turner" "P42_turner" "P43_turner" "P44_turner"  "P45_turner" "P46_turner" "P47_turner" "P48_turner" "P49_turner" "P50_turner" "P51_turner" "P52_turner" "P53_turner" ];
name15  = ["P01_starrynight" "P02_starrynight" "P03_starrynight" "P04_starrynight" "P05_starrynight" "P06_starrynight" "P07_starrynight" "P08_starrynight" "P09_starrynight" "P10_starrynight"   "P11_starrynight" "P12_starrynight" "P13_starrynight" "P14_starrynight" "P15_starrynight" "P16_starrynight" "P17_starrynight" "P18_starrynight" "P19_starrynight" "P20_starrynight" "P21_starrynight" "P22_starrynight" "P23_starrynight" "P24_starrynight" "P25_starrynight" "P26_starrynight" "P27_starrynight" "P28_starrynight" "P29_starrynight" "P30_starrynight" "P31_starrynight" "P32_starrynight" "P33_starrynight" "P34_starrynight" "P35_starrynight" "P36_starrynight" "P37_starrynight" "P38_starrynight" "P39_starrynight" "P40_starrynight" "P41_starrynight" "P42_starrynight" "P43_starrynight" "P44_starrynight" "P45_starrynight" "P46_starrynight" "P47_starrynight" "P48_starrynight" "P49_starrynight" "P50_starrynight" "P51_starrynight" "P52_starrynight" "P53_starrynight" "P01_turner" "P02_turner" "P03_turner" "P04_turner" "P05_turner" "P06_turner" "P07_turner" "P08_turner" "P09_turner" "P10_turner" "P11_turner" "P12_turner" "P13_turner" "P14_turner"   "P15_turner" "P16_turner" "P17_turner" "P18_turner" "P19_turner" "P20_turner" "P21_turner" "P22_turner" "P23_turner" "P24_turner"  "P25_turner" "P26_turner" "P27_turner" "P28_turner" "P29_turner" "P30_turner" "P31_turner" "P32_turner" "P33_turner" "P34_turner"  "P35_turner" "P36_turner" "P37_turner" "P38_turner" "P39_turner" "P40_turner" "P41_turner" "P42_turner" "P43_turner" "P44_turner"  "P45_turner" "P46_turner" "P47_turner" "P48_turner" "P49_turner" "P50_turner" "P51_turner" "P52_turner" "P53_turner" ];

name_cat = [name1; name2; name3; name4; name5; name6; name7; name8; name9; name10; name11; name12; name13; name14; name15;];

test_matrix = strings(16, 17);

test_matrix(1,1) = 'Match Pair';
test_matrix(1,2) = 'AvA vs AvA P-value';
test_matrix(1,3) = 'AvA vs AvA std';
test_matrix(1,4) = 'AvA vs AvB P-value';
test_matrix(1,5) = 'AvA vs AvB std';
test_matrix(1,6) = 'BvB vs AvB P-value';
test_matrix(1,7) = 'BvB vs AvB std';
test_matrix(1,8) = 'BvB vs BvB P-value';
test_matrix(1,9) = 'BvB vs BvB std';
test_matrix(1,10) = 'AvA and AvA Effect Size';
test_matrix(1,11) = 'AvA and AvA Confidence';
test_matrix(1,12) = 'AvA and AvB Effect Size';
test_matrix(1,13) = 'AvA and AvB Confidence';
test_matrix(1,14) = 'BvB and AvB Effect Size';
test_matrix(1,15) = 'BvB and AvB Confidence';
test_matrix(1,16) = 'BvB and BvB Effect Size';
test_matrix(1,17) = 'BvB and BvB Confidence';

for z = 1:15
names = name_cat(z,:);
name1 = strrep(names(1),'P01_','');
name2 = strrep(names(54),'P01_','');
filename = sprintf('%s_%s_%s.mat', name_prefix, name1, name2);
load(filename); % Matches
w = z+1;

if strcmp(name_prefix,'MultiMatch1')
    Matches = resultsMultiMatch1;
end
if strcmp(name_prefix,'MultiMatch2')
    Matches = resultsMultiMatch2;
end
if strcmp(name_prefix,'MultiMatch3')
    Matches = resultsMultiMatch2;
end
if strcmp(name_prefix,'MultiMatch4')
    Matches = resultsMultiMatch4;
end
if strcmp(name_prefix,'MultiMatch5')
    Matches = resultsMultiMatch5;
end
if strcmp(name_prefix,'ScanMatch')
    Matches = ScanMatchResults;
end

AvA = zeros(1, 1378); % top left
AvB = zeros(1, 1378); % bottom left
BvB = zeros(1, 1378); % bottom right

test_matrix(w, 1) = sprintf('%s vs %s', name1, name2);

% Top Left
pos = 1;
count = 1;
for i = 1:52
    pos = pos + 1;
    for j = pos:53
        %AvA = [AvA Matches(i,j)];
        AvA(1,count) = Matches(i,j);
        Matches(i,j) = 0;
        count = count + 1;
    end
end

% Bottom Left
pos = 1;
count = 1;
for i = 1:52
    pos = pos + 1;
    for j = pos:53
        %AvB = [AvB Matches(i+53,j)];
        AvB(1,count) = Matches(i+53,j);
        Matches(i+53,j) = 0;
        count = count + 1;
    end
end

% Bottom Right
pos = 1;
count = 1;
for i = 1:52
    pos = pos + 1;
    for j = pos:53
        %BvB = [BvB Matches(i+53,j+53)];
        BvB(1,count) = Matches(i+53,j+53);
        Matches(i+53,j+53) = 0;
        count = count + 1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%
% Calculate P Values %
%%%%%%%%%%%%%%%%%%%%%%

% P Value for AvA vs AvA
p_values = zeros(1,1000);
for i = 1:1000
[h, p] = ttest2( randsample(AvA, 100) , randsample(AvA, 100) );
p_values(i) = p;
end
sprintf('%s vs %s: AvA vs AvA p value is %f with std of %f', name1, name2, mean(p_values), std(p_values));
test_matrix(w, 2) = mean(p_values);
test_matrix(w, 3) = std(p_values);

% P Value for AvA vs AvB
p_values = zeros(1,1000);
for i = 1:1000
[h, p] = ttest2( randsample(AvA, 100) , randsample(AvB, 100) );
p_values(i) = p;
end
sprintf('%s vs %s: AvA vs AvB p value is %f with std of %f', name1, name2, mean(p_values), std(p_values));
test_matrix(w, 4) = mean(p_values);
test_matrix(w, 5) = std(p_values);

% P Value for BvB vs AvB
p_values = zeros(1,1000);
for i = 1:1000
[h, p] = ttest2( randsample(BvB, 100) , randsample(AvB, 100) );
p_values(i) = p;
end
sprintf('%s vs %s: BvB vs AvB p value is %f with std of %f', name1, name2, mean(p_values), std(p_values));
test_matrix(w, 6) = mean(p_values);
test_matrix(w, 7) = std(p_values);

% P Value for BvB vs BvB
p_values = zeros(1,1000);
for i = 1:1000
[h, p] = ttest2( randsample(BvB, 100) , randsample(BvB, 100) );
p_values(i) = p;
end
sprintf('%s vs %s: BvB vs BvB p value is %f with std of %f', name1, name2, mean(p_values), std(p_values));
test_matrix(w, 8) = mean(p_values);
test_matrix(w, 9) = std(p_values);

%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate effect size %
%%%%%%%%%%%%%%%%%%%%%%%%%

effect1 = meanEffectSize(AvA',AvA',Effect="cohen");
effect2 = meanEffectSize(AvA',AvB',Effect="cohen");
effect3 = meanEffectSize(BvB',AvB',Effect="cohen");
effect4 = meanEffectSize(BvB',BvB',Effect="cohen");

sprintf('%s vs %s: effect size for AvA and AvA is %f [%f %f]', name1, name2, effect1.Effect, effect1.ConfidenceIntervals(1), effect1.ConfidenceIntervals(2));
sprintf('%s vs %s: effect size for AvA and AvB is %f [%f %f]', name1, name2, effect2.Effect, effect2.ConfidenceIntervals(1), effect2.ConfidenceIntervals(2));
sprintf('%s vs %s: effect size for BvB and AvB is %f [%f %f]', name1, name2, effect3.Effect, effect3.ConfidenceIntervals(1), effect3.ConfidenceIntervals(2));
sprintf('%s vs %s: effect size for BvB and BvB is %f [%f %f]', name1, name2, effect4.Effect, effect4.ConfidenceIntervals(1), effect4.ConfidenceIntervals(2));

test_matrix(w, 10) = effect1.Effect;
test_matrix(w, 11) = sprintf('[%f %f]', effect1.ConfidenceIntervals(1), effect1.ConfidenceIntervals(2));

test_matrix(w, 12) = effect2.Effect;
test_matrix(w, 13) = sprintf('[%f %f]', effect2.ConfidenceIntervals(1), effect2.ConfidenceIntervals(2));

test_matrix(w, 14) = effect3.Effect;
test_matrix(w, 15) = sprintf('[%f %f]', effect3.ConfidenceIntervals(1), effect3.ConfidenceIntervals(2));

test_matrix(w, 16) = effect4.Effect;
test_matrix(w, 17) = sprintf('[%f %f]', effect4.ConfidenceIntervals(1), effect4.ConfidenceIntervals(2));

end

writematrix(test_matrix, sprintf('%s.csv', name_prefix) );
toc

end