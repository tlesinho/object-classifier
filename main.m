nclass = 5;
nimage = 5;

nr_b = 2;
nc_b = 3;
nbin = 9;

Sx = [-1 0 1; -2 0 1; -1 0 1];
Sy = [-1 -2 -1; 0 0 0; 1 2 1];

Training_HoG = {};
c = 1;
minDifference = 0;
testClasses_by_L1 = zeros(1, 25);
testClasses_by_L2 = zeros(1, 25);
testClasses_by_Chi = zeros(1, 25);

%HoG for Training
for class_no = 1:nclass
    for image_no = 1:nimage
        filepath = strcat(num2str(class_no), '\', num2str(class_no), num2str(image_no), '_Training.bmp');
        I = imread(filepath);
        
        Ix = imfilter(double(I), Sx);
        Iy = imfilter(double(I), Sy);
        I_mag = sqrt(Ix.^2 + Iy.^2);
        [nr, nc] = size(I_mag);
        
        % Gradient orientation of training images
        I_angle = Get_Gradient_Orientation(Ix, Iy, nr, nc);
         
         % number of histogram bins
        
        Image_HoG = Get_HoG(I_mag, I_angle, nr_b, nc_b, nbin);
        Training_HoG{c} = Image_HoG;
        c = c + 1;
    end
end

testClass = 0;
c = 1;
%HoG for Testing
for class_no = 1:nclass
    for image_no = 1:nimage
        filepath = strcat(num2str(class_no), '\', num2str(class_no), num2str(image_no), '_Test.bmp');
        I = imread(filepath);
        
        Ix = imfilter(double(I), Sx);
        Iy = imfilter(double(I), Sy);
        I_mag = sqrt(Ix.^2 + Iy.^2);
        [nr, nc] = size(I_mag);
        
        % Gradient orientation of training images
        I_angle = Get_Gradient_Orientation(Ix, Iy, nr, nc);
         
        
        nbin = 9; % number of histogram bins
        
        Test_HoG = Get_HoG(I_mag, I_angle, nr_b, nc_b, nbin);
        
        testClass = Class_by_L1(Test_HoG, Training_HoG);
        testClasses_by_L1(1, c) = testClass;
        
        testClass = Class_by_L2(Test_HoG, Training_HoG);
        testClasses_by_L2(1, c) = testClass;
        
        testClass = Class_by_Chi(Test_HoG, Training_HoG);
        testClasses_by_Chi(1, c) = testClass;
        
        c = c + 1;
    end
end
testClasses_by_L1
testClasses_by_L2
testClasses_by_Chi
    
        