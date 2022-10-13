function [analog_out] = dac(digital_in)
    VFS = 2*(7);
    % 8-Bit ADC means 2^8 = 256 levels
    VLSB = VFS/(2^8);
    analog_out = VLSB*bin2dec(digital_in);
end