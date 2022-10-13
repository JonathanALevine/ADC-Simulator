function [digital_out] = adc(analog_in, linear)
    digital_out = "";
    VFS = 2*(7);
    % 8-Bit ADC means 2^8 = 256 levels
    for i=7:-1:0
        VLSB = 1*VFS/(2^8);
        if rand(1) > 0.25 && linear == 0
            VLSB = 2*VFS/(2^8);
        end
        check_val = VLSB*(2^i);
        if analog_in > check_val
            digital_out = digital_out + "1";
            analog_in = analog_in - check_val;
        else
            digital_out = digital_out + "0";
        end
    end
    return
end