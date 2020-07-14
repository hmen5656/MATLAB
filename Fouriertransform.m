clear all
clc
k=0;
xt=zeros(1,2001);
xt(1:1000)=1;
% for t=0:0.001:2
%     k=k+1;
%     if t<=0.5
%         x(k)=2*t;
%     elseif (t>0.5) & (t<=1)
%         x(k)=2-2*t;
%     end
% end
% xt=[x(1:2000) x(1:2000) x(1:2000)];
% t=0:0.001:6-0.001;
% plot(t,xt)
% hold on

k=0;
i=1;

figure(1)
for z=20:21;
    clear tk genelak xn xsk
    tk=0;
    i=1;
    for p=-z:z;
        
        for t=0:0.001:2
            k=k+1;
            ak=xt(k)*exp(-j*pi*t*p);
            tk=tk+ak;
        end
        genelak(i)=(1/2)*tk;
        i=i+1;
        tk=0;
        k=0;
    end
   
    xr=zeros(1,2001);
    p=0;
    for t=0:0.001:10
        l=0;
        xn=0;
        xsk=0;
        for i=-z:z
            l=l+1;
            xsk=genelak(l)*exp(j*t*pi*i);
            xn=xn+xsk;
        end
        p=p+1;
        xr(p)= xn;
        
    end
    xr=xr./1000;
    t=0:0.001:10;
    figure(1)
    plot(t,xr);
    pause(0.05)
end

