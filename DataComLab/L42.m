close all;
clc;
fs=8000;
f=400;
t=0:1/fs:1-1/fs;
A=3.0;
powfund=A^2/2;
s=0.1;
varnoise=s^2;
signal=A*sin(2*pi*f*t);
noise=s*randn(size(signal));
NoisySignal=signal+noise;
SNR=snr(NoisySignal);
defSNR=10*log10(powfund/varnoise);
bandwidth=obw(NoisySignal, fs);
Capacity=bandwidth*log2(1+SNR)