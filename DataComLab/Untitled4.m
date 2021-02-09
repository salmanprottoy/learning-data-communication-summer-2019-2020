A = 1;
B = 8;
C = 3;
D = 6;
E = 8;
F = 9;
G = 4;
H = 1;
AMP1 = 36;
AMP2 = 68;
AMP3 = 89;
FREQ1 = 183;
FREQ2 = 368;
FREQ3 = 941;
deg1 = deg2rad(30);
deg2 = deg2rad(60);
FREQs = 40e3; 
T1 = 0:1/FREQs:0.025;
FREQ5 = 1./T1;
subplot(5,1,1);
X1 = AMP1*cos(2*pi*FREQ1*T1);
plot(T1, X1,'b');
xlabel('Time');
ylabel('Amplitude');
title('Input Signal')
subplot(5,1,2);
X2 = AMP2*cos(2*pi*FREQ2*T1+deg1);
plot(T1, X2, 'g');
xlabel('Time');
ylabel('Amplitude');
subplot(5,1,3);
X3 = AMP1*cos(2*pi*FREQ3*T1+deg2);
plot(T1, X3);
xlabel('Time');
ylabel('Amplitude');
subplot(5,1,4);
X = X1 + X2 + X3;
plot(T1, X);
xlabel('Time');
ylabel('Amplitude');
title('Composite Signal')
subplot(5,1,5);
N = length(X);                                
Ts = mean(diff(T1));                                                             
Fn = FREQs/2;                                          
FT_Signal = fft(X)/N;                          % Normalized Fourier Transform Of Data
Fv = linspace(0, 1, fix(N/2)+1)*Fn;                 
Iv = 1:length(Fv);                                  
plot(Fv, abs(FT_Signal(Iv))*2);
xlabel('Frequency');
ylabel('Amplitude');
 


%B) 
T2 = 0:1/FREQs:0.025;
L = 8;
delta = (max(X)-min(X))/L;
Xq = min(X) + (round((X-min(X))/delta)).*delta;
figure;
subplot(2,1,1)
stem(T2, X);
subplot(2, 1, 2);
stairs(T2, Xq,'b');


%C) 
a = 0.1;
noise = a * randn(size(X));
noisySignal = X + noise;
n = 2;
powfund = A^2/2;
powhurm = a^2/2;
THD = thd(noisySignal, 2);
defTHD = 10*log(powhurm / powfund);
bandwidth_with = obw(noisySignal, FREQs);
bandwidth_without = obw(X, FREQs);
SNR = snr(noisySignal);
defSNR= 10*log10(powfund/a);
capacity = bandwidth_with * log2(1+SNR);
SINAD = sinad(noisySignal);
L = 2^(capacity/(2*bandwidth_without));
output = [bandwidth_with bandwidth_without; capacity L; SNR SINAD]

