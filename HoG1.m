function [ ghist ] = HoG1( Im, Ip, nbin )
% Compute the HoG of an image block, with unsigned gradient (i.e. 0-180)
% Im: magnitude of the image block
% Ip: orientation of the image block
% nbin: number of orientation bins
ghist = zeros(1, nbin);
[nr1, nc1] = size(Im);
% Compute the HoG
interval = 180/nbin; % the interval for a bin, and what is “????”?
for i = 1:nr1
 for j = 1:nc1
 index = floor(Ip(i, j)/interval)+1;
 ghist(index) = ghist(index) + Im(i, j);
 end
end
end