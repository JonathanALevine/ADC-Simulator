close all;  
clear; %intialization

set(0,'DefaultFigureWindowStyle','docked')

Fs = 10*10e9;            % Sampling frequency                    
T = 10*1/Fs;             % Sampling period       
L = 100000;             % Length of signal
t = (0:L-1)*T;  % Time vector

% clock = 0.5*(square(2*pi*Fs*t-pi)+1);

clock_frequency = 4*10e9;
t = linspace(0, 10e-9, 1000000);
clock = 0.5*(square(2*pi*clock_frequency*t) + 1);

freq_carrier = 5*10e9;
freq_harmonic = 12*10e9;
fin = 0.7*sin(2*pi*freq_carrier*t) + sin(2*pi*freq_harmonic*t) + 2;

samples = zeros(1, length(t));

hold_state = 0;
hold_val = samples(1);
linear = 1;
for i=2:length(t)
    if clock(i) == 1 && hold_state == 0
        digitized_version = adc(fin(i), linear);
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
plot(t,fin)

subplot(3, 1, 2)
plot(t, clock)

subplot(3, 1, 3)
plot(t, samples)

title("Signal Corrupted with Zero-Mean Random Noise")
xlabel("t (s)")
ylabel("fin(t)")

% figure(2)
% % L = length(X)
% L = 8192
% Y = fft(fin, L);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% 
% f = Fs*(0:(L/2))/L;
% plot(f,P1) 
% title("Single-Sided Amplitude Spectrum of X(t)")
% xlabel("f (Hz)")
% ylabel("|P1(f)|")