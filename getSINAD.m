function [val] = getSINAD(power_vals)
    noise = 0;
    num_noise = 0;

    [power_vals, idx] = sort(power_vals, 'descend');

    % signal = max(power_vals);
    signal = power_vals(1);

    % Remove the 5 biggest harmonics
    power_vals(idx([1 2 3 4 5])) = [];
    
    rough_noise_floor = mean(power_vals);
    for i=1:length(power_vals)
        if power_vals(i) < rough_noise_floor
            noise = noise + power_vals(i);
            num_noise = num_noise + 1;
        end
    end
    avg_noise = noise/num_noise;
    val = 10*log10((signal+avg_noise)/avg_noise);
end