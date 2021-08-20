function fixation_sequence_cellarray = TemporalBinning(table, time_bin_size)


time_counter = 0;

fixation_sequence = [];
fixation_sequence_cellarray = {};

    for row = 1:height(table)

        fixation_duration = table(row,:).t;
        fixation_hilbert = table(row,:).h;

        if time_counter < time_bin_size 
            % add hilbert to fixation sequence array
            fixation_sequence = [fixation_sequence; fixation_hilbert time_counter];
            time_counter = time_counter + fixation_duration;
        else

             % append fixation sequence array to cell array
            fixation_sequence_cellarray{end+1} = fixation_sequence;

            last_hilbert = fixation_sequence(end, 1);            
            fixation_sequence = [];

            remaining_time = time_counter - time_bin_size ;       
            if remaining_time > 0 
                % add last fixation to start of new fixation array
                fixation_sequence = [fixation_sequence; last_hilbert remaining_time];
            end

            % append to fixation array with current fixation
            fixation_sequence = [fixation_sequence; fixation_hilbert time_counter];

            time_counter = remaining_time;
        end

    end

end