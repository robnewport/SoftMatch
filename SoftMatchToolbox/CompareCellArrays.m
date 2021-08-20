function [matches, distanceSum] = CompareCellArrays(cellArray1, cellArray2, tolerance)
    
    matches = 0;
    distanceSum = 0;
    
    for n = 1:length(cellArray1)
    
        d = [];
        
        for j = 1:length(cellArray2)
        
            sequence1 = cellArray1{n};
            sequence2 = cellArray2{j};

            distance = DiscreteFrechetDist(sequence1,sequence2);
            
            if tolerance ~= 0 
                if distance < tolerance
                    matches = matches + 1;
                end                
            end

            
            d = [d distance];
            
        end
        
         if isempty(d) == 0
            distanceSum = distanceSum + min(d());
         end
        
        
    end
    
end
