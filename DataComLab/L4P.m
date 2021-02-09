%ID=18-36087-1
close all;
clc;
A1 = 18;
A2 = 18;
s = 11;
fs=8000;
t = 0:1/fs:1-1/fs;
x=A1*sin(2*pi*3*100*t)+A2*cos(2*pi*7*100*t)+s*randn(size(t));
SNR=snr(x)
bandwidth=obw(x,fs)
Capacity=bandwidth*log2(1+SNR)
BR=Capacity;
L=2^(BR/(2*bandwidth));
L=round(L)