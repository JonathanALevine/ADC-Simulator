function [val] = getSFDR(power_vals)
    VFS_dB = 20*log10(2*(10+5));
    max_spur = 0;
    for i=1:length(power_vals)
        if max_spur < power_vals(i) && power_vals(i) < 0.5
            max_spur = power_vals(i);
        end
    end
    val = VFS_dB - 10*log10(max_spur);
end