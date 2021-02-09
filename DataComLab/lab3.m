%(a)
A1=76;
A2=18;
%(b)
fs=1000;
t=0:1/fs:1-1/fs;
C=3;
F=3;
x1=A1*cos(2*pi*C*t);
x2=A2*cos(2*pi*F*t);
x3=x1+x2;
bandwidth = obw(x3,fs);
plot(t,x3,'b--o','LineWidth',1.5)
xlabel('Time in seconds')
ylabel('Amplitude in volts')
title('Signals in Different Frequencies')
%(c)
fx1=fft(x3);
fx1=fftshift(fx1)/(fs/2);
f=fs/2*linspace(-1,1,fs);
figure;
plot(f,abs(fx1),'LineWidth',1.5);
title ('Magnitude FFT of sine');
axis([-10 10 0 60])
xlabel('Frequency(Hz)');
ylabel('Magnitude');
%(d)
fx1=fft(x3);
fx1=fftshift(fx1)/(fs/2);
f=fs/2*linspace(-1,1,fs);
figure;
plot(f,abs(fx1),'LineWidth',1.5);
title ('Magnitude FFT of sine');
axis([-10 10 0 60])
xlabel('Frequency(Hz)');
ylabel('Magnitude');
partition = [-60,-30,0,30,60];
codebook=[-60,-36,-12,12,36,60];
[index,quants] = quantiz(x3,partition,codebook);
plot(t,x3,'x',t,quants,'-','LineWidth',1.5)
legend('Original signal','Quantized signal');