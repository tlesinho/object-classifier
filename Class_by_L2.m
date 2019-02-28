function [testClass] = Class_by_L2 (Test_HoG, Training_HoG)
minDifference = 0;
for c = 1:25
             d = (Test_HoG - Training_HoG{c}).^2;
             d1 = sum(d);
                if (d1 <= minDifference) || (minDifference == 0)
                   minDifference = d1;
                   if (c > 0 && c < 6)
                       testClass = 1;
                   end
                   if(c > 5 && c < 11)
                       testClass = 2;
                   end
                   if (c > 10 && c < 16)
                       testClass = 3;
                   end
                   if(c > 15 && c < 21) 
                       testClass = 4;
                   end
                   if (c > 20 && c < 26)
                       testClass = 5;
                   end
                    
                end
end