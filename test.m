close all;  
clear; %intialization

set(0,'DefaultFigureWindowStyle','docked')

% Simulation settings 
linear_adc = 1;
random_noise = 0;
jitter_val = 0;
jitter_freq = 0.5;

sampling_rate = 10*10e9;
clock_frequency = 0.5*sampling_rate;
clock_period = 1/clock_frequency;

start_time = 0*clock_period;
end_time = 100000*clock_period;

% clock_num_points = 1*(end_time - start_time)/(clock_period);
clock_num_points = 1000000;
clock_times = linspace(start_time, end_time, clock_num_points);

input_sequence = myInputSequence(clock_times, random_noise);
clock = myClock(clock_times, clock_frequency, 0, jitter_freq);
clock_jitter = myClock(clock_times, clock_frequency, 1, jitter_freq);

num_points = 1000;
subplot(2, 1, 1)
plot(clock_times(1:num_points), clock(1:num_points)) 

subplot(2, 1, 2)
plot(clock_times(1:num_points), clock_jitter(1:num_points))
