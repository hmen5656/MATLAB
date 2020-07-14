clear all;
hold off;
i_boyut = 10;
i2_boyut = 50;
S = ones(i2_boyut);
H = 2*ones(i_boyut);
projector = 2;
sensors = 70;
sensors = sensors - 1;
baslangic = floor(i_boyut/2);
S(1:10,41:50) = H;
P = zeros(projector,sensors);
X_points = 1:i2_boyut;
Y_points = 1:i2_boyut;
sensor=1;
derece=1;
sum_beam=0;
grid on; grid minor;
for j=0:pi/projector:pi-0.0001
 for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
   if j<=pi/2
     Y_axis=tand(j)*(X_points-i2_boyut/2+i)+i2_boyut/2+i;
     X_axis=cotd(j)*(Y_points-i2_boyut/2-i)+i2_boyut/2-i;
     Y_sorted=[Y_points ,Y_axis];
     X_sorted=[X_points ,X_axis];
     Y_sorted=sort(Y_sorted);
     X_sorted=sort(X_sorted);
   end
   if j > (pi/2)
    Y_axis = tand(j)*(X_points-(i2_boyut/2)+i)+(i2_boyut/2)-i;
    X_axis = (cotd(j))*(Y_points-(i2_boyut/2)+i)+(i2_boyut/2)-i;
    X_sorted = [X_points , X_axis];
    Y_sorted = [Y_points  , Y_axis];
    X_sorted = sort(X_sorted);
    Y_sorted = fliplr(sort(Y_sorted));
 end
 sum_beam=0;
for k = 1:length(Y_sorted)-1
         X_point = ceil(X_sorted(k));
         Y_point = ceil(Y_sorted(k));
         if X_point <0 || X_point >i2_boyut
            continue
        end
        if Y_point <0 || Y_point >i2_boyut
            continue
        end
         if(X_point == 0)
             X_point = 1;
         end
         if(Y_point == 0)
             Y_point = 1;
         end
        intensity = S(X_point,Y_point);
        len = ((X_sorted(k+1)-X_sorted(k))^2+(Y_sorted(k+1)-Y_sorted(k))^2)^0.5;
        sum_beam = sum_beam +len*intensity;
     end
     P(derece,sensor) = sum_beam
     sensor = sensor + 1;
     subplot(1,2,1)
    plot(X_sorted,Y_sorted);
    grid on; grid minor;
     xlim([-2*i2_boyut 2*i2_boyut]) ;
     ylim([-2*i2_boyut 2*i2_boyut]);
    hold on;
     subplot(1,2,2)
     stem(P(derece,:))
     pause(0.04);
     hold on;
     grid on; grid minor;
     xlim([0 2*i2_boyut]) ;
     ylim([0 2*i2_boyut]);
    end
derece=derece+1;
sensor=1;
end
##subplot(2,2,1)
##subplot(2,2,2)
##plot(P(2,:))
##subplot(2,2,3)
##plot(P(3,:))
##subplot(2,2,4)
##plot(P(4,:))


 
 