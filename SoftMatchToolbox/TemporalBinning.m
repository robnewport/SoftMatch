function fixation_sequence_cellarray = TemporalBinning(table, time_bin_size)

fixation_sequence = [];
fixation_sequence_cellarray = {};

time_counter = 1;

    for row = 1:height(table)

        fixation_duration = table(row,:).t;
        fixation_hilbert = table(row,:).h;

        if time_counter < time_bin_size 
            %% Add hilbert to fixation sequence array
            fixation_sequence = [fixation_sequence; fixation_hilbert time_counter];
            time_counter = time_counter + fixation_duration;
        else

            %% Append fixation sequence array to cell array
            fixation_sequence_cellarray{end+1} = fixation_sequence;
            
            %% Truncate to last value
            last_hilbert = fixation_sequence(end, 1);
            remaining_time = time_counter - time_bin_size ;  
            
            %% Start new sequence
            fixation_sequence = [];

            if remaining_time > 0 
                %% Add last fixation to start of new fixation array if time remains
                fixation_sequence = [fixation_sequence; last_hilbert remaining_time];
                time_counter = remaining_time;
            else
                %% Reset the counter if no more time remains
                time_counter = 1;
            end
        end
    end
end
