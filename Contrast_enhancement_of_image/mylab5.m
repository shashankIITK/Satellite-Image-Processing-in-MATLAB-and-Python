%% Making false colour composite using given bands:
I1 = imread("E:\Shashanks recent folder\My labs\Remote sensing labs\Lab5\Data_Lab_5\L3-NG44I02-099-053-14oct08-BAND2.tif");
I2 = imread("E:\Shashanks recent folder\My labs\Remote sensing labs\Lab5\Data_Lab_5\L3-NG44I02-099-053-14oct08-BAND3.tif");
I3 = imread("E:\Shashanks recent folder\My labs\Remote sensing labs\Lab5\Data_Lab_5\L3-NG44I02-099-053-14oct08-BAND4.tif");
imshow(I1);
figure, imshow(I2);
figure, imshow(I3);
MCC(:,:,1)=I3;
MCC(:,:,2)=I2;
MCC(:,:,3)=I1;
figure, imshow(MCC);
%% %% changing into double
i1 = im2double(I1);
figure, imshow(i1);
i2 = im2double(I2);
i3 = im2double(I3);
%% Calculation of histogram , mean, standard deviation , variance of each image and histogram equalization for Band2:
figure  
imhist(i1);
mean1 = mean(i1(:));
std1 = std(i1(:));
var1 = var(i1(:));

Histeq1 = histeq(i1);
%Histeqi1=double(Histeq1(:));
figure
imhist(Histeq1);

mean1hist = mean(Histeq1(:));
std1hist = std(Histeq1(:));
var1hist = var(Histeq1(:));

figure()
subplot(1,2,1)
imshow(i1,[])
title('original image: Band2')
subplot(1,2,2)
imshow(Histeq1,[])
title('After Histogram equilization band 2');

%% Calculation of histogram , mean, standard deviation , variance of each image and histogram equalization for Band3:

figure  
imhist(i2);
mean2 = mean(i2(:));
std2 = std(i2(:));
var2 = var(i2(:));

Histeq2 = histeq(i2);
%Histeqi1=double(Histeq1(:));
figure
imhist(Histeq2);

mean2hist = mean(Histeq2(:));
std2hist = std(Histeq2(:));
var2hist = var(Histeq2(:));

figure()
subplot(1,2,1)
imshow(i2,[])
title('original image: Band3')
subplot(1,2,2)
imshow(Histeq2,[])
title('After Histogram equilization band 3');

%% %% Calculation of histogram , mean, standard deviation , variance of each image and histogram equalization for Band4:

figure  
imhist(i3);
mean3 = mean(i3(:));
std3 = std(i3(:));
var3 = var(i3(:));

Histeq3 = histeq(i3);
%Histeqi1=double(Histeq1(:));
figure
imhist(Histeq3);

mean3hist = mean(Histeq3(:));
std3hist = std(Histeq3(:));
var3hist = var(Histeq3(:));

figure()
subplot(1,2,1)
imshow(i3,[])
title('original image: Band4')
subplot(1,2,2)
imshow(Histeq3,[])
title('After Histogram equilization band 4');

%% Making colour composite out of histogram equilized bands-
%HisteqMCC = histeq(MCC);
MCC_Histeq(:,:,1)=Histeq3;
MCC_Histeq(:,:,2)=Histeq2;
MCC_Histeq(:,:,3)=Histeq1;
figure, imshow(MCC_Histeq);

figure()
subplot(1,2,1)
imshow(MCC,[])
title('original Colour composite')
subplot(1,2,2)
imshow(MCC_Histeq,[])
title('Colour composite after Histogram equilization');

%% Applying inverse transformation to each band- Band2

image_inversed1 = zeros(size(i1));
[p,q]=size(i1);
      for x = 1:p
          for y = 1:q
              m1=i1(x,y);
              image_inversed1(x,y)=(255-m1); 
          end
      end
      image_inversed1 = mat2gray(image_inversed1);
figure()
subplot(1,2,1)
imshow(i1,[])
title('original image: Band2')
subplot(1,2,2)
imshow(image_inversed1,[])
title('After inverting band 2');

figure  
imhist(image_inversed1);




mean1inv = mean(image_inversed1(:));
std1inv = std(image_inversed1(:));
var1inv = var(image_inversed1(:));


%% Applying inverse transformation to each band- Band3


image_inversed2 = zeros(size(i2));
[pp,qq]=size(i2);
      for xx = 1:pp
          for yy = 1:qq
              m1=i2(xx,yy);
              image_inversed2(xx,yy)=(255-m1); 
          end
      end
      image_inversed2 = mat2gray(image_inversed2);
figure()
subplot(1,2,1)
imshow(i2,[])
title('original image: Band3')
subplot(1,2,2)
imshow(image_inversed2,[])
title('After inverting band 3');

figure  
imhist(image_inversed2);




mean2inv = mean(image_inversed2(:));
std2inv = std(image_inversed2(:));
var2inv = var(image_inversed2(:));


%% Applying inverse transformation to each band- Band4

image_inversed3 = zeros(size(i3));
[ppp,qqq]=size(i3);
      for xxx = 1:ppp
          for yyy = 1:qqq
              m3=i3(xxx,yyy);
              image_inversed3(xxx,yyy)=(255-m3); 
          end
      end
      image_inversed3 = mat2gray(image_inversed3);
figure()
subplot(1,2,1)
imshow(i3,[])
title('original image: Band4')
subplot(1,2,2)
imshow(image_inversed3,[])
title('After inverting band 4');

figure  
imhist(image_inversed3);




mean3inv = mean(image_inversed3(:));
std3inv = std(image_inversed3(:));
var3inv = var(image_inversed3(:));

%% Colour composite of inverted bands-
MCC_inverted(:,:,1)=image_inversed3;
MCC_inverted(:,:,2)=image_inversed2;
MCC_inverted(:,:,3)=image_inversed1;
figure, imshow(MCC_inverted);

figure()
subplot(1,2,1)
imshow(MCC,[])
title('original Colour composite')
subplot(1,2,2)
imshow(MCC_inverted,[])
title('Colour composite after Histogram equilization');

%% Power transformations to band-
%for band 2-
figure()
subplot(1,3,1);
imshow(i1);
title("original image")
y=1;C=2;
powwer1=C*i1.^y;
subplot(1,3,2);
imshow(powwer1);
title("for y=1, C=2")
C=3;
powwer1=C*i1.^y;
subplot(1,3,3);
imshow(powwer1);
title("for y=1, C=3")

figure()
subplot(1,3,1);
imshow(i1);
title("original image")
y=2;C=1;
powwer1=C*i1.^y;
subplot(1,3,2);
imshow(powwer1);
title("for y=2, C=1")
y=3;C=1;
powwer1=C*i1.^y;
subplot(1,3,3);
imshow(powwer1);
title("for y=3, C=1")
%% 













        
       







