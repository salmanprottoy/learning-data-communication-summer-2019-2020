A=1;
B=8;
C=3;
D=6;
E=0;
F=8;
G=7;
H=1;

A1 = (G*10)+D; %A1 = GD = 76
A2 = (A*10)+F; %A2 = AF = 18
fc = ((C*100 + D*10 + E)*100); % fc = CDE = 360
fs = 40e3;
t = 0:1/fs:0.005;
x = A1 * cos(2*pi*fc*t);
n = 4;
L = (2^n);
delta = (max(x)-min(x))/L;
xq = min(x)+(round((x-min(x))/delta)).*delta;
figure;
stem(t,x,'R');
hold on;
stairs(t,xq,'b','linewidth',3.2);
hold off;
title('Quantized signal')
xlabel('time')
ylabel('amplitude')
