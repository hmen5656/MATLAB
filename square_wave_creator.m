clc
clear all
k=0;
xt=zeros(1,4000);
xt(1:1000)=1;
xt(3001:4000)=1;
t=linspace(0,4,4001);
t=t(1:4000);

i=1;
T=4;
z=2000;

for k=[-z:z]
    sumi=0;
    for t1=0:1/1000:4-1/1000
        sumi=sumi+xt(uint16(t1*1000)+1)*exp(-j*k*2*pi*t1/4);
    end
     ak(k+z+1)=sumi/T;
end

figure;
stem([-z:z],ak);
s=0;
for t2=-8:1/1000:8
    sumi2=0;
    s=s+1;
    for k=[-z:z]
    sumi2=sumi2+ak(k+z+1)*exp(j*k*2*pi*t2/4);
    end
    xt2(s)=sumi2;
end
figure;
plot((-8:1/1000:8),xt2);
