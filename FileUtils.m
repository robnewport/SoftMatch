
classdef FileUtils
    properties (Constant = true)
        rootDir = '/Users/robnewport/PhD/VisualTrackingShared';
        experimentsDir = '/CEPET_SeedGrant2019_DataAsOf24Aug2020';
        filename = '/Favorites - CEPET Seeding Grant 2019 - %s.txt';
        matlabDir = '/CEPET_SeedGrant2019_MatlabDataAsOf14Oct2020';
        matlabfilename = '/%s.mat';
        participantCodes = ["C001" "C002" "C003" "C004" "C005" "C006" "C007" "C008" "C009" "C010" "C011" "C012" "C013" "C014" "C015" "C016" "R01" "R02" "R03" "R04" "R05" "R06" "R07" "R08" "R09" "R10" "R11" "R12" "R13" "R14" "R15" "R16" "R17" "R18" "R20" "R21" "R22" "R23" "R24" "R25" "R26" "R28" "R29" "R30" "R31" "Cpilot1" "Cpilot2" "NMQ_1" "NMQ_2" "NMQ_3" "NMQ_4" "NMQ_5" "NMQ_6" ];
        participantNames = ["P01" "P02" "P03" "P04" "P05" "P06" "P07" "P08" "P09" "P10" "P11" "P12" "P13" "P14" "P15" "P16" "P17" "P18" "P19" "P20" "P21" "P22" "P23" "P24" "P25" "P26" "P27" "P28" "P29" "P30" "P31" "P32" "P33" "P34" "P35" "P36" "P37" "P38" "P39" "P40" "P41" "P42" "P43" "P44" "P45" "P46" "P47" "P48" "P49" "P50" "P51" "P52" "P53" ];        
        % participantNames = ["C001" "C002" "C003" "C004" "C005" "C006" "C007" "C008" "C009" "C010" "C011" "C012" "C013" "C014" "C015" "C016" "R01" "R02" "R03" "R04" "R05" "R06" "R07" "R08" "R09" "R10" "R11" "R12" "R13" "R14" "R15" "R16" "R17" "R18" "R20" "R21" "R22" "R23" "R24" "R25" "R26" "R28" "R29" "R30" "R31" "Cpilot1" "Cpilot2" "NMQ1" "NMQ2" "NMQ3" "NMQ4" "NMQ5" "NMQ6" ];        
    end
    methods(Static)
        function table = tableFor(participant)            
            filename = sprintf(FileUtils.filename, participant);
            path = sprintf('%s%s%s',FileUtils.rootDir, FileUtils.experimentsDir, filename);
            table = readtable(path);
        end
        function trial = trialFor(table, trialname)
            trial = table(strcmp(table.Trial, trialname),:);
        end
        function path = matlabPathFor(participant)
            filename = sprintf(FileUtils.matlabfilename, participant);
            path = sprintf('%s%s%s',FileUtils.rootDir, FileUtils.matlabDir, filename);
        end
        function names_array = experimentNames(shortname1, shortname2)
            names_array = [];

%             stimulus = 'ARTLAND_4_convergence' % Convergence by Pollock
%             shortname = 'convergence'

            for j = 1:length(FileUtils.participantCodes)
                names = FileUtils.participantNames(j);
                filename = sprintf("%s_%s",names, shortname1);
                names_array = [names_array, filename];
            end

%             stimulus = 'ARTLAND_6_Blue Poles' % Blue Pole by Pollock
%             shortname = 'bluepoles'

            for j = 1:length(FileUtils.participantCodes)
                names = FileUtils.participantNames(j);
                filename = sprintf("%s_%s",names, shortname2);
                names_array = [names_array, filename];
            end
        end
    end
end

