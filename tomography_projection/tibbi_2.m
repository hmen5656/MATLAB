clear all;
hold off;
i_boyut = 10;
i2_boyut = 50;
S = ones(i2_boyut);
H = zeros(i_boyut);
projector = 4;
sensors = 70;
sensors = sensors - 1;
middle2 = floor(i2_boyut/2);
middle1= floor(i_boyut/2);
S(middle2-middle1+1:middle2+middle1,middle2-middle1+1:middle2+middle1) = H;
P = zeros(projector,sensors);
X_points = 1:i2_boyut;
Y_points = 1:i2_boyut;
sensor=1;
sum_beam=0;
## %% for 0 degree
## a=figure('Name','for 0 degree');
for j=1:projector
  sensor=1;
  if j==1
 for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
     Y0_axis(1:i2_boyut)=-i+i2_boyut/2;
     X0_axis=X_points;
     for k = 1:length(Y0_axis)-1
         X_point = ceil(X0_axis(k));
         Y_point = ceil(Y0_axis(k));
         if(X_point == 0)
             X_point = 1;
         end
         if(Y_point == 0)
             Y_point = 1;
         end
        intensity = S(X_point,Y_point);
        len = 1;
        sum_beam = sum_beam +len*intensity;
     end
     P(1,sensor) = sum_beam;
     sum_beam=0;
     sensor = sensor + 1;
##     subplot(1,2,1)
##    plot(X0_axis,Y0_axis);
##     xlim([-2*i2_boyut 2*i2_boyut]) ;
##     ylim([-2*i2_boyut 2*i2_boyut]);
##    hold on;
##     subplot(1,2,2)
##     stem(P(1,:))
##     pause(0.04);
##     hold on;
##     grid on;
##     xlim([0 2*i2_boyut]) ;
##     ylim([0 2*i2_boyut]);
 end
 hold off;
end
## pause(3)
## for 45 degree
##b=figure('Name','for 45 degree');
if j==2
 for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
    Y45_axis = (Y_points+i);
     X45_axis = X_points-i;
    for k = 1:length(X45_axis)-1
        X_point = ceil(X45_axis(k));
        Y_point = ceil(Y45_axis(k));
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
       len = 1;
       sum_beam = sum_beam +len*intensity;
    end
    P(2,sensor) = sum_beam;
    sum_beam=0;
    sensor = sensor + 1;
##    subplot(1,2,1)
##    plot(X45_axis,Y45_axis);
##     xlim([-2*i2_boyut 2*i2_boyut]) ;
##    ylim([-2*i2_boyut 2*i2_boyut]);
##    hold on;
##    grid on;
##    subplot(1,2,2)
##    stem(P(2,:))
##    xlim([0 2*i2_boyut]) ;
##    ylim([0  2*i2_boyut]);
##    pause(0.5);
##    hold on;
##    grid on;
    end
end
##hold off;
## pause(3)
## %%for 90 degree
## c=figure('Name','for 90 degree');
if j==3
for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
     X90_axis(1:i2_boyut)=i2_boyut/2-i;
     Y90_axis = Y_points;
     for k = 1:length(X90_axis)-1
         X_point = ceil(X90_axis(k));
         Y_point = ceil(Y90_axis(k));
         if(X_point == 0)
             X_point = 1;
         end
         if(Y_point == 0)
             Y_point = 1;
         end
        intensity = S(X_point,Y_point);
        len = 1;
        sum_beam = sum_beam +len*intensity;
     end
     P(3,sensor) = sum_beam;
     sum_beam=0;
     sensor = sensor + 1;
##     subplot(1,2,1)
##     plot(X90_axis,Y90_axis);
##     xlim([-i2_boyut 2*i2_boyut]) ;
##     ylim([-i2_boyut 2*i2_boyut]);
##     hold on;
##     subplot(1,2,2)
##     stem(P(3,:))
##    xlim([0 2*i2_boyut]) ;
##    ylim([0  2*i2_boyut]);
##     pause(0.04);
##     hold on;
##     grid on;
 end
 #hold off;
## pause(3)
end
## %%for 135 degree
## d = figure('Name','for 135 degree');

 if j==4
 for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
    Y135_axis = -(Y_points-i2_boyut-i);
    X135_axis = X_points+i;
    
     for k = 1:length(X135_axis)-1
         X_point = ceil(X135_axis(k));
         Y_point = ceil(Y135_axis(k));
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
        len = 1;
        sum_beam = sum_beam +len*intensity;
     end
     P(4,sensor) = sum_beam;
     sum_beam=0;
     sensor = sensor + 1;
     subplot(1,2,1)
     plot(X135_axis,Y135_axis);
     xlim([-2*i2_boyut 2*i2_boyut]) ;
     ylim([-2*i2_boyut 2*i2_boyut]);
     hold on;
     grid on;
     hold on;
     subplot(1,2,2)
     stem(P(4,:))
     xlim([0 2*i2_boyut]) ;
     ylim([0 2*i2_boyut]);
     pause(0.04);
     hold on;
     grid on;
     xlim([-2*i2_boyut 2*i2_boyut]) ;
     ylim([-2*i2_boyut 2*i2_boyut]);   
end
end
end
figure
subplot(2,2,1)
plot(P(1,:))
subplot(2,2,2)
plot(P(2,:))
subplot(2,2,3)
plot(P(3,:))
subplot(2,2,4)
plot(P(4,:))


 
 