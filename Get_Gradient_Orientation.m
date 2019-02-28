function [I_angle] = Get_Gradient_Orientation(Ix, Iy, nr, nc)
        for j=1:nr
            for i=1:nc
                if abs(Ix(j,i))<=0.0001 && abs(Iy(j,i))<=0.0001
                   I_angle(j, i) = 0.00;
                else
                    if Ix(j,i)~=0
                        Ipr(j, i) = atan(Iy(j,i)/Ix(j,i));
                        I_angle(j, i) = Ipr(j, i)*180/pi;
                            if I_angle(j, i) < 0
                                I_angle(j, i)=180+I_angle(j, i);
                            end
                    else
                        Ipr(j, i) = pi/2;
                        I_angle(j, i) = 90;
                    end
                end
            end
         end