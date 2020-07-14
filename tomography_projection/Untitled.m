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

for j =0:45:135
    if(j<=90)
        for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
            Y_axis = tan(j)*(X_points-(i2_boyut/2)+i)+(i2_boyut/2)+i;
            X_axis = (cot(j))*(Y_points-(i2_boyut/2)-i)+(i2_boyut/2)-i;
            X_axis = sort([X_points X_axis]);
            Y_axis = sort([Y_points Y_axis]);
            sum_beam=0;
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
            P(derece,sensor) = sum_beam;
            sum_beam=0;
            sensor = sensor + 1;
        end
        derece=derece+1;
        sensor=1;
    end
    if(j>90)
        for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
            Y_axis = -tan(j)*(X_points-(i2_boyut/2)+i)+(i2_boyut/2)+i;
            X_axis = (cot(j))*(Y_points-(i2_boyut/2)-i)+(i2_boyut/2)-i;
            X_axis = sort([X_points X_axis]);
            Y_axis = sort([Y_points Y_axis]);
            sum_beam=0;
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
            P(derece,sensor) = sum_beam;
            sum_beam=0;
            sensor = sensor + 1;
        end
        derece=derece+1;
        sensor=1;
    end
    
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
    pause(0.5);
    hold on;
    grid on;

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