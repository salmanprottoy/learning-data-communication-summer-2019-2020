%Data Communication Project
%18-36894-1
val1 = 360;
val2= 87;
fc=2;
text='Tanvir Rahman Tarafder';
data=asc2bn(text);
disp(data)
Itt=[];
Qtt=[];
It=[];
Qt=[];
vll=val1;
for k=1:1:numel(data)/2
    if(data(2*k-1)==1)
        It=[It ones(1,vll)*100];
    end
    if(data(2*k-1)==0)
        It=[It -ones(1,vll)*100];
    end
    if(data(2*k)==1)
        Qt=[Qt ones(1,vll)*100];
    end
    if(data(2*k)==0)
        Qt=[Qt -ones(1,vll)*100];
    end
end
t=1/vll:1/vll:numel(data)/2;
ct=cos(2*pi*fc*t);
Itct=ct.*It;
subplot(911);
title('QPSK Modulation');
subplot(912),plot(t,ct);
subplot(913),plot(t,Itct);
st=sin(2*pi*fc*t);
Qtst=Qt.*st;
subplot(914),plot(t,Qt);
subplot(915),plot(t,st) ;
subplot(916),plot(t,Qtst);
qpsks=Itct+(-Qtst);
axis off
noiseSignal = (mean(qpsks)/val2)*rand(1, numel(qpsks));
qpskst=qpsks-noiseSignal;
%demodulation
dem=[];
for k=0:vll:numel(qpskst)-vll
    sym1=qpskst(1,1+k:vll+k);
    tT=t(1,1:vll);
    prod=sym1.*(sqrt(2)*cos(2*pi*fc*tT));
    Int = sum(prod);
    dem=[dem sign(Int)];
    prod1=sym1.*(-sqrt(2)*sin(2*pi*fc*tT));
    Int1=sum(prod1);
    dem=[dem sign(Int1)];
end
for k=1:1:numel(dem)
    if(dem(k)==-1)
        dem(k)=0;
    end
end
text=bin2asc(dem);
disp(text)