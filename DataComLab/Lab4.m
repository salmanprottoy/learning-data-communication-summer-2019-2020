A=1; B=8; C=3; D=6; E=8; F=3; G=0; H=1; A1=18; A2=13; s=11;
fs = 8000;
f = 400;
t = 0:1/fs:1-1/fs;
A = A1+A2;
x = A1* sin(2*pi*C*100*t ) + A2 *cos(2*pi*G*100*t) + s*randn(size(t)); signal = A*sin(2*pi*f*t);
noise = s*randn(size(signal)); noisySignal = signal + noise; SNR = snr(noisySignal)

bandwidth = obw(x,fs)


SNR = snr(x);
Capacity = bandwidth*log2(1+SNR)


powfund = A1^2/2; powharm = A2^2/2; varnoise = s^2;
THD = thd(x);
 
defTHD = 10*log10(powharm/powfund);


TH = [THD defTHD]
SINAD = sinad(x);
defSINAD = 10*log10(powfund/(powharm+varnoise));


SI = [SINAD defSINAD]