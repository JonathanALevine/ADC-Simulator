close all;  
clear; %intialization

set(0,'DefaultFigureWindowStyle','docked')

% Simulation settings 
linear_adc = 1;
random_noise = 1;


sampling_rate = 10*10e9;
clock_frequency = 0.5*sampling_rate;
clock_period = 1/clock_frequency;

start_time = 0*clock_period;
end_time = 100000*clock_period;

% clock_num_points = 1*(end_time - start_time)/(clock_period);
clock_num_points = 1000000;
clock_times = linspace(start_time, end_time, clock_num_points);

input_sequence = myInputSequence(clock_times, random_noise);
clock = 0.5*(square(2*pi*clock_frequency*clock_times-pi)+1);

samples = zeros(1, length(clock_times));

hold_state = 0;
hold_val = samples(1);
for i=2:length(clock_times)
    if clock(i) == 1 && hold_state == 0
        digitized_version = adc(input_sequence(i), linear_adc);
        samples(i) = dac(digitized_version);
        hold_val = samples(i);
        hold_state = 1;
    end
    if clock(i) == 0
        samples(i) = hold_val;
        hold_state = 0;
        hold_val = samples(i);
    end
    if hold_state == 1
        samples(i) = hold_val;
    end
end

figure(1)
subplot(3, 1, 1)
plot(clock_times(1:10000), input_sequence(1:10000))

subplot(3, 1, 2)
plot(clock_times(1:1000), clock(1:1000))

subplot(3, 1, 3)
plot(clock_times(1:10000), samples(1:10000))

figure(2)
% L = length(samples);
L = 8192;
Y = fft(samples, L);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = clock_frequency*(0:(L/2))/L;

plot(f(1:100)*10e-7,(P1(1:100))) 
title("Amplitude Spectrum of Sampled Signal")
xlabel("frequency (GHz)")
ylabel("Signal Power ")

SNR = getSNR(P1)
ideal_SNR = 6.02*8-1.76;
matlab_snr = snr(samples);
SFDR = getSFDR(P1)
SINAD = getSINAD(P1)
ENOB = getENOB(SINAD)


