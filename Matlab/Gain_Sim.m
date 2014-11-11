clear all;
load('freq_sim.txt');
load('S21_sim.txt');

load('Sparam_measured_freq.csv');
load('Sparam_measured_magS21.csv');
load('Sparam_measured_angS21.csv');

S21_ang_cos = cos(Sparam_measured_angS21);
S21_ang_sin = sin(Sparam_measured_angS21);

%S21_meas = Sparam_measured_magS21.*S21_ang_cos + i.*Sparam_measured_magS

S21_sim = S21_sim';
S21 = S21_sim(1,1:end)+i.*S21_sim(2,1:end);

plot(freq_sim(226:236),20.*log10(abs(S21(226:236))),Sparam_measured_freq(71:91),20.*log10(Sparam_measured_magS21(71:91)));
xlabel('Frequency [Hz]');
ylabel('Gain [dB]');
grid on;
title('Small-signal gain (S_2_1)');
legend('Simulated in ADS','Measured with VNA','location','NW');