# ADC Simulator

A small MATLAB simulator for exploring 8-bit analog-to-digital conversion. Models quantization, additive noise, clock-timing perturbations and nonlinear conversion, with time-domain plots and frequency-domain analysis.

## Usage

Requires MATLAB and Signal Processing Toolbox (`square`). From the repository directory, run:

```matlab
main
```

The script plots the input, sampling clock, reconstructed output and spectrum, and prints estimates of SNR, SINAD, SFDR and ENOB.

Change the settings near the top of `main.m` to explore different effects:

```matlab
linear_adc = 1;   % Set to 0 for nonlinear conversion
random_noise = 0; % Set to 1 to add input noise
jitter = 0;       % Set to 1 to perturb the clock
```

The conversion model is in [adc.m](adc.m), the clock model in [myClock.m](myClock.m), and the input waveform in [myInputSequence.m](myInputSequence.m).

## Example

![Input waveform, sampling clock and reconstructed ADC output](Figures/time_domains.png)

An existing example from the simulator: input waveform (top), sampling clock (middle), and reconstructed output (bottom).
