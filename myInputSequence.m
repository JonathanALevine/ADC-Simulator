function [sequence] = myInputSequence(clock_times, random_noise)
    fundamental = 10*1e6;
    harmonic = 5*1e6;

    power_fundamental = 1;
    power_harmonic = 0.5;

    if random_noise == 0
        sequence = power_fundamental*sin(2*pi*fundamental*clock_times) ...
            + power_harmonic*sin(2*pi*harmonic*clock_times) + 4;
    else
        sequence = power_fundamental*sin(2*pi*fundamental*clock_times) ...
            + power_harmonic*sin(2*pi*harmonic*clock_times) + 4 ...
            + 0.25*randn(size(clock_times));
    end
end