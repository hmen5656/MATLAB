

i2_boyut =length(a);
i_boyut = i2_boyut/2;
S = a;
turning=5;
projector = length(0:turning:179);
sensors = 100;
sensors = sensors - 1;
middle2 = floor(i2_boyut/2);
middle1= floor(i_boyut/2);
P = zeros(projector,sensors);
X_points = 1:i2_boyut;
Y_points = 1:i2_boyut;
sensor=1;
sum_beam=0;
derece=1;
for j =0:turning:179
    if(j<=90)
        for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
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
        end
        derece=derece+1;
        sensor=1;
    end
    if(j>90)
        for i = i2_boyut/2:(-i2_boyut/sensors):-i2_boyut/2
            Y_axis = tand(j)*(X_points-(i2_boyut/2)+i)+(i2_boyut/2)-i;
            X_axis = (cotd(j))*(Y_points-(i2_boyut/2)+i)+(i2_boyut/2)-i;
            X_axis = sort([X_points X_axis]);
            Y_axis = flip(sort([Y_points Y_axis]));
            
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

%%
%% Back Projection part
%%
bp_boyut=50;
XBP_points=1:bp_boyut;
YBP_points=1:bp_boyut;
BP=zeros(bp_boyut);
derece=1;
for j =0:turning:179
    if(j<=90)
        for i = bp_boyut/2:(-bp_boyut/sensors):-bp_boyut/2
            YBP_axis = tand(j)*(XBP_points-(bp_boyut/2)+i)+(bp_boyut/2)+i;
            XBP_axis = (cotd(j))*(YBP_points-(bp_boyut/2)-i)+(bp_boyut/2)-i;
            XBP_axis = sort([XBP_points XBP_axis]);
            YBP_axis = sort([YBP_points YBP_axis]);
            for k = 1:length(XBP_axis)-1
                XBP_point = ceil(XBP_axis(k));
                YBP_point = ceil(YBP_axis(k));
               if XBP_point <0 || XBP_point >bp_boyut
                    continue
                end
                if YBP_point <0 || YBP_point >bp_boyut
                    continue
                end
                if(XBP_point == 0)
                    XBP_point = 1;
                end
                if(YBP_point == 0)
                    YBP_point = 1;
                end
                BP(XBP_point,YBP_point) =BP(XBP_point,YBP_point) +P(derece,sensor);
            end
            sensor = sensor + 1;
        end
        derece=derece+1;
        sensor=1;
    end
    if(j>90)
        for i = bp_boyut/2:(-bp_boyut/sensors):-bp_boyut/2
            YBP_axis = tand(j)*(XBP_points-(bp_boyut/2)+i)+(bp_boyut/2)-i;
            XBP_axis = (cotd(j))*(YBP_points-(bp_boyut/2)+i)+(bp_boyut/2)-i;
            XBP_axis = sort([XBP_points XBP_axis]);
            YBP_axis = fliplr(sort([YBP_points YBP_axis]));
            for k = 1:length(XBP_axis)-1
                XBP_point = ceil(XBP_axis(k));
                YBP_point = ceil(YBP_axis(k));
                if XBP_point <0 || XBP_point >bp_boyut
                    continue
                end
                if YBP_point <0 || YBP_point >bp_boyut
                    continue
                end
                if(XBP_point == 0)
                    XBP_point = 1;
                end
                if(YBP_point == 0)
                    YBP_point = 1;
                end
                 BP(XBP_point,YBP_point) =BP(XBP_point,YBP_point) +P(derece,sensor);
            end
            sensor = sensor + 1;
        end
        derece=derece+1;
        sensor=1;
    end
end

##for g =1:projector
##subplot(2,projector/2,g)
##plot(P(g,:))
##xlim([-5 sensors+5]) ;
##ylim([-5 2*i2_boyut]);
##title(g*turning - turning)
##end

imagesc(BP);
colormap bone;
figure;
imagesc(S);
colormap bone;