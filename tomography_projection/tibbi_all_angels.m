clear all;
hold off;
i_boyut = 10;
i2_boyut = 30;
S = ones(i2_boyut);
H = 2*ones(i_boyut);
turning=45;
projector = length(0:turning:179);
sensors = 40;
sensors = sensors - 1;
middle2 = floor(i2_boyut/2);
middle1= floor(i_boyut/2);
S(8:17,8:17) = H;
P = zeros(projector,sensors);
X_points = 1:i2_boyut;
Y_points = 1:i2_boyut;
sensor=1;
sum_beam=0;
derece=1;
for j =0:turning:179
    if(j<=90)
        for i = -i2_boyut/2:(i2_boyut/sensors):i2_boyut/2
            Y_axis = tand(j)*(X_points-(i2_boyut/2)+i)+(i2_boyut/2)+i;
            X_axis = (cotd(j))*(Y_points-(i2_boyut/2)-i)+(i2_boyut/2)-i;
            X_axis = sort([X_points X_axis]);
            Y_axis = sort([Y_points Y_axis]);
            sum_beam=0;
            for k = 1:length(X_axis)-1
                X_point = ceil(X_axis(k));
                Y_point = ceil(Y_axis(k));
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
            P(derece,sensor) = sum_beam;
            sum_beam=0;
            sensor = sensor + 1;
            subplot(1,2,1)
            plot(X_axis,Y_axis);
            grid minor;
            xlim([-2*i2_boyut 2*i2_boyut]) ;
            ylim([-2*i2_boyut 2*i2_boyut]);
            hold on;
            grid on;
            subplot(1,2,2);
            stem(P(derece,:));
            grid minor;
            xlim([0 2*i2_boyut]) ;
            ylim([0  2*i2_boyut]);
            pause(0.05);
            hold on;
            grid on;
        end
        derece=derece+1;
        sensor=1;
    end
    if(j>90)
        for i = -i2_boyut/2:(i2_boyut/sensors):i2_boyut/2
            Y_axis = tand(j)*(X_points-(i2_boyut/2)+i)+(i2_boyut/2)-i;
            X_axis = (cotd(j))*(Y_points-(i2_boyut/2)+i)+(i2_boyut/2)-i;
            X_axis = sort([X_points X_axis]);
            Y_axis = flip(sort([Y_points Y_axis]));
            sum_beam=0;
            for k = 1:length(X_axis)-1
                X_point = ceil(X_axis(k));
                Y_point = ceil(Y_axis(k));
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
            P(derece,sensor) = sum_beam;
            sum_beam=0;
            sensor = sensor + 1;

        end
        derece=derece+1;
        sensor=1;

    end
    
  

end
for g =1:projector
 subplot(2,projector/2,g)
plot(P(g,:))
xlim([-5 sensors+5]) ;
ylim([-5 2*i2_boyut]);
title(g*turning - turning)
end