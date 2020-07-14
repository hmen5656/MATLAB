function kokler(handles,durum)
C1=str2double(get(handles.editc,'String'));
L1=str2double(get(handles.editl,'String'));
R1=str2double(get(handles.editr,'String'));
VS=str2double(get(handles.editv0,'String'));
i0=str2double(get(handles.editi0,'String'));
set(handles.wd1,'Visible','off');
%%%%%%%
if get(handles.uf,'Value')==1  
    C=C1*10^(-6);
elseif   get(handles.mf,'Value')==1 
    C=C1*10^(-3);
elseif  get(handles.nf,'Value')==1    
    C=C1*10^(-9);
else
    C=C1;
end
%%%%%%%
if get(handles.uh,'Value')==1
    L=L1*10^(-6);
elseif get(handles.mh,'Value')==1
    
    L=L1*10^(-3);
elseif get(handles.nh,'Value')==1
     L=L1*10^(-9);
else
    L=L1;
end
%%%%%%%
if get(handles.kohm,'Value') ==1
    R=R1*10^(3);
else
    R=R1;
end    
if get(handles.ma,'Value') ==1
    is=i0*10^(-3);
else
    is=i0;
end
    alfa=1/(2*R*C)
    omega = 1/sqrt(L*C)
    s1=-alfa - sqrt(alfa^2-omega^2)
    s2=-alfa + sqrt(alfa^2-omega^2)
    set(handles.koks1,'String',num2str(s1));
    set(handles.koks2,'String',num2str(s2));

 if alfa > omega
      set(handles.sonumturu,'String','Asiri sonumlu RLC Devresi');
    ir=VS/R;
    ic=-(is+ir);
    icc=ic/C;
    syms A1 A2 t
    eq1 = A1+A2==VS
    eq2 = s1*A1+s2*A2==icc
    [K1,K2] = solve(eq1,eq2)
    V(t)=K1*exp(s1*t)+K2*exp(s2*t)
    IR(t)=V(t)/R
    IC(t)=diff(V(t))
    IL(t)=-(IR(t)+IC(t))
    t=0:0.00001:25*R*C;
    if durum==0
        subplot(1,1,1);
        plot(t,V(t),'r');
    grid on;
 else
    subplot(2,2,1);
    plot(t,V(t),'r');
    grid on;
    legend('V(t)');
    subplot(2,2,2);
    plot(t,IR(t),'y');
    grid on;
    legend('IR(t)');
    subplot(2,2,3);
    plot(t,IC(t),'b');
    grid on;
    legend('IC(t)');
    subplot(2,2,4);
    plot(t,IL(t),'m');
    grid on;
    legend('IL(t)');
    grid on;
 end

  elseif alfa < omega
      
    set(handles.sonumturu,'String','Eksik sonumlu RLC Devresi');
    set(handles.wd1,'Visible','on');
    wd=sqrt(-alfa^2+omega^2)
    set(handles.wd,'String',num2str(wd));
    syms B1 B2 t
    ir=VS/R
    ic=-(is+ir)
    icc=ic/C
    eq1 = B1==VS;
    eq2 = (-alfa)*B1+wd*B2==icc;
    [K1,K2] = solve(eq1,eq2)
    V(t)=K1*exp(-alfa*t)*cos(wd*t)+K2*exp(-alfa*t)*sin(wd*t)
    IR(t)=V(t)/R
    IC(t)=diff(V(t))
    IL(t)=-(IR(t)+IC(t))
    t=0:0.00001:25*R*C;
    if durum==0
        subplot(1,1,1);
        plot(t,V(t),'r');
    grid on;
 else
    subplot(2,2,1);
    plot(t,V(t),'r');
    grid on;
    legend('V(t)');
    subplot(2,2,2);
    plot(t,IR(t),'y');
    grid on;
    legend('IR(t)');
    subplot(2,2,3);
    plot(t,IC(t),'b');
    grid on;
    legend('IC(t)');
    subplot(2,2,4);
    plot(t,IL(t),'m');
    grid on;
    legend('IL(t)');
    grid on;
 end
    
    
    
  elseif  alfa == omega  
    set(handles.sonumturu,'String','Kritik sonumlu RLC Devresi');
    ir=VS/R
    ic=-(is+ir)
    icc=ic/C
    syms D1 D2
    eq1 = D2==VS;
    eq2 = D1-alfa*D2==icc;
    [K1,K2] = solve(eq1,eq2)
    syms t
    V(t)=K1*t*exp(-alfa*t)+K2*exp(-alfa*t)
    IR(t)=V(t)/R
    IC(t)=diff(V(t))
    IL(t)=-(IR(t)+IC(t))
    t=0:0.00001:25*R*C;
    if durum==0
    subplot(1,1,1);
    plot(t,V(t),'r');
    grid on;
 else
    subplot(2,2,1);
    plot(t,V(t),'r');
    grid on;
    legend('V(t)');
    subplot(2,2,2);
    plot(t,IR(t),'y');
    grid on;
    legend('IR(t)');
    subplot(2,2,3);
    plot(t,IC(t),'b');
    grid on;
    legend('IC(t)');
    subplot(2,2,4);
    plot(t,IL(t),'m');
    grid on;
    legend('IL(t)');
    grid on;
 end
  end
end
