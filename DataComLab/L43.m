close all;
clc;
fs=48e3;
t=0:1/fs:1-1/fs;
A=1.0;
powfund=A^2/2;
a=0.4;
powharm=a^2/2;
s=0.1;
varnoise=s^2;
x=A*cos(2*pi*1000*t)+a*sin(2*pi*2000*t)+s*randn(size(t));
THD=thd(x);
defTHD=10*log10(powharm/powfund);
TH=[THD defTHD]

SINAD=sinad(x);
defSINAD=10*log10(powfund/(powharm+varnoise));
SI=[SINAD defSINAD]
SNR=snr(x);
bandwidth=obw(x,fs);
c=bandwidth*log2(1+SNR)
