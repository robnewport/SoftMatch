participantCodes = ["C001" "C002" "C003" "C004" "C005" "C006" "C007" "C008" "C009" "C010" "C011" "C012" "C013" "C014" "C015" "C016" "R01" "R02" "R03" "R04" "R05" "R06" "R07" "R08" "R09" "R10" "R11" "R12" "R13" "R14" "R15" "R16" "R17" "R18" "R20" "R21" "R22" "R23" "R24" "R25" "R26" "R28" "R29" "R30" "R31" "Cpilot1" "Cpilot2" "NMQ_1" "NMQ_2" "NMQ_3" "NMQ_4" "NMQ_5" "NMQ_6" ];
participantNames = ["P01" "P02" "P03" "P04" "P05" "P06" "P07" "P08" "P09" "P10" "P11" "P12" "P13" "P14" "P15" "P16" "P17" "P18" "P19" "P20" "P21" "P22" "P23" "P24" "P25" "P26" "P27" "P28" "P29" "P30" "P31" "P32" "P33" "P34" "P35" "P36" "P37" "P38" "P39" "P40" "P41" "P42" "P43" "P44" "P45" "P46" "P47" "P48" "P49" "P50" "P51" "P52" "P53" ];        

stimulusCodes = ["ARTLAND_6_Blue Poles" "ARTLAND_13_Blue Spot_Cohen" "ARTLAND_4_convergence" "ARTLAND_14_Pasiphae" "ARTLAND_1_Van Gogh Starry Night" "ARTLAND_10_Turner" ];
stimulusNames = ["bluepoles" "bluespot" "convergence" "pasiphae" "starrynight" "turner"];

for j = 1:length(stimulusCodes)

    for i = 1:length(participantCodes)
            c = participantCodes(i);
            n = participantNames(i);

            data = Scanpath_DataPrep(c, stimulusCodes(j) );
            T = array2table(data, 'VariableNames',{'x','y','t','h'});

            filename = sprintf('%s_%s.txt',n, stimulusNames(j) );
            writetable(T,filename);
            type filename;
    end

end

beep()
