function [Image_HoG] = Get_HoG(I_mag, I_angle, nr_b, nc_b, nbin)
[nr, nc] = size(I_mag);
nr_size = nr/nr_b;
nc_size = nc/nc_b;
Image_HoG = zeros(1, nbin*nr_b*nc_b);
        for i=1:nr_b
            for j=1:nc_b
                I_mag_block = I_mag((i-1)*nr_size+1:i*nr_size, (j-1)*nc_size+1:j*nc_size);
                I_angle_block = I_angle((i-1)*nr_size+1:i*nr_size, (j-1)*nc_size+1:j*nc_size);
                 % HoG1 is a function to create the HoG histogram
                 gh=HoG1(I_mag_block, I_angle_block, nbin);
                 % Histogram_Normalization is a function to normalize the input histogram gh
                 ngh=Histogram_Normalization(gh);
                 pos = (j-1)*nbin+(i-1)*nc_b*nbin+1;
                 Image_HoG(pos:pos+nbin-1) = ngh;
            end
        end