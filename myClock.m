function [clock_vals] = myClock(clock_times, clock_frequency, jitter_val, jitter_freq)
    if jitter_val == 0
        clock_vals = 0.5*(square(2*pi*clock_frequency*clock_times-pi)+1);
    else
        clock_vals = zeros(1, length(clock_times));
        for i=2:length(clock_times)
            if rand() > jitter_freq && clock_vals(i-1) == 0
                clock_vals(i) = 0;
            elseif rand() > jitter_freq && clock_vals(i-1) == 1
                clock_vals(i) = 1;
            else
                clock_vals(i) = 0.5*(square(2*pi*clock_frequency*clock_times(i)-pi)+1);
            end
        end
    end
end

