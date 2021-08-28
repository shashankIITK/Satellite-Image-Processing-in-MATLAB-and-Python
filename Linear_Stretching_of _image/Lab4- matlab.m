%% Importing L4 imagery and creating FCC.

z4= imread("E:\Shashanks recent folder\My labs\Remote sensing labs\Lab3\Myimagery.tif")
CC2(:,:,1) = z4(:,:,4);
CC2(:,:,2) = z4(:,:,3);
CC2(:,:,3) = z4(:,:,2);
figure
imshow(CC2);
%% Band 1 of FCC displaying and stretching-
my_image1 = CC2(:,:,1);
figure
imshow(my_image1);
figure
imhist(my_image1);

Newmin = 0;
Newmax = 255;
min = 40;
max = 200;
image_thresholded1 = zeros(size(my_image1));
% loop over all rows and columns
for ii=1:size(my_image1,1)
    for jj=1:size(my_image1,2)
        % get pixel value
        pixel1=my_image1(ii,jj);
          % check pixel value and assign new value
          
         I1 = ((pixel1 - min)*((Newmax-Newmin)/(max-min)))+ (Newmin);
         image_thresholded1(ii,jj)=I1;
    end
end
figure()
subplot(1,2,1)
imshow(my_image1,[])
title('original image-band 1')
subplot(1,2,2)
imshow(image_thresholded1,[])
title('stretched image band 1')



%% Band 2 of FCC displaying and stretching-
my_image2 = CC2(:,:,2);
figure
imshow(my_image2);
figure
imhist(my_image2);

Newmin = 0;
Newmax = 255;
min = 65;
max = 160;
image_thresholded2 = zeros(size(my_image2));
% loop over all rows and columns
for kk=1:size(my_image2,1)
    for ll=1:size(my_image2,2)
        % get pixel value
        pixel2=my_image2(kk,ll);
          % check pixel value and assign new value
          
         I2 = ((pixel2 - min)*((Newmax-Newmin)/(max-min)))+ (Newmin);
         image_thresholded2(kk,ll)=I2;
    end
end
figure()
subplot(1,2,1)
imshow(my_image2,[])
title('original image-band 2')
subplot(1,2,2)
imshow(image_thresholded2,[])
title('stretched image band 2')


%% Band 3 of FCC displaying and stretching-
my_image3 = CC2(:,:,3);
figure
imshow(my_image3);
figure
imhist(my_image3);

Newmin = 0;
Newmax = 255;
min = 65;
max = 135;
image_thresholded3 = zeros(size(my_image3));
% loop over all rows and columns
for mm=1:size(my_image3,1)
    for nn=1:size(my_image3,2)
        % get pixel value
        pixel3=my_image3(mm,nn);
          % check pixel value and assign new value
          
         I3 = ((pixel3 - min)*((Newmax-Newmin)/(max-min)))+ (Newmin);
         image_thresholded3(mm,nn)=I3;
    end
end
figure()
subplot(1,2,1)
imshow(my_image3,[])
title('original image-band 3')
subplot(1,2,2)
imshow(image_thresholded3,[])
title('stretched image band 3')

