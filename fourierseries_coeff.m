clc; clear all;
k=0;
xt=zeros(1,7);
xt(1)=2;
xt(2)=1;
xt(3)=-3;
xt(5)=(-3/2);
n=0:5;
N=7;
z=20;
figure;
stem([0:6],xt);
xlim([-3 10]);
title("X[n] - before F.S")
for k=1:N
    sumi=0;
    for n1=1:N
        sumi=sumi+xt(n1)*exp(-j*(k-1)*2*pi*n1/N);
    end
     ak(k)=sumi/N;
end
figure;
stem(ak);
title("ak")
s=0;
z2=20;
for n2=-z2:z2
    sumi2=0;
    s=s+1;
    for k=1:N
    sumi2=sumi2+ak(k)*exp(j*(k-1)*2*pi*n2/N);
    end
    xt2(s)=sumi2;
end
figure;
stem((-z2:z2),xt2);
title("X[n] - after F.S")

