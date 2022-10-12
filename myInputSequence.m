function [sequence] = myInputSequence(clock_times, random_noise)
    fundamental = 10*10e6;
    harmonic = 5*10e6;

    power_fundamental = 1;
    power_harmonic = 0.5;

    sequence = power_fundamental*sin(2*pi*fundamental*clock_times) ...
        + power_harmonic*sin(2*pi*harmonic*clock_times) + 2;
end