clear all;
hold off;
projector = 30;
sensors = 20;
sensors = sensors - 1;
i_boyut = 31;
i2_boyut = i_boyut*2;
baslangic = floor(i_boyut/2);
X_points = 1:i2_boyut;
Y_points = 1:i2_boyut;
H = ones(i2_boyut);
deg = 1;
sensor=1;
grid minor;
count=0;
for a =0:pi/projector:pi-0.0001
    image(H)
for i = (i_boyut):(-i2_boyut/sensors):-i_boyut
     if a<=(pi/2)
     [X,Y,x,y]=first_quarter(X_points,Y_points,i_boyut,i,a);
     end
     if(a>pi/2)
     [X,Y,x,y]=second_quarter(X_points,Y_points,i_boyut,i,a);
     end
%     plot(X,Y,'o')
%     hold on;
%     pause(0.05)
    grid on;
    count=count+1;
    sum_beam=0;
    sinirlar= find(X < baslangic | X > baslangic+i_boyut | Y < baslangic | Y > baslangic+i_boyut) ;
    X(sinirlar) = [];
    Y(sinirlar) = [];
    for k = 1:length(X)-1
        X_point = ceil(X(k));
        Y_point = ceil(Y(k));
        if(X_point == 0)
            X_point = 1;
        end
        if(Y_point == 0)
            Y_point = 1;
        end
       intensity = H(X_point,Y_point);
       len = ((X(k)-X(k+1))^2+(Y(k)-Y(k+1))^2)^0.5;
       sum_beam = sum_beam +len*intensity;
        
    end
    
    line(X_points,y)
    pause(0.05)
    grid on;
    hold on;
    xlim([-110 i2_boyut+90]) ;
    ylim([-110 i2_boyut+90]);
end
hold off
disp(count)
end