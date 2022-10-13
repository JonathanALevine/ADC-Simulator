function [val] = getSFDR(power_vals)
    VFS = 2*(7);
    VFS_dB = 20*log10(VFS);
    max_spur = 0;
    for i=1:length(power_vals)
        if max_spur < power_vals(i) && power_vals(i) < 0.5
            max_spur = power_vals(i);
        end
    end
    val = VFS_dB - 20*log10(max_spur);
end