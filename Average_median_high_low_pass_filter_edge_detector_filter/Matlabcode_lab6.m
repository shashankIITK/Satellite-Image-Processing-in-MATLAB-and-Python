% reading Image
I = imread("D:\Shashanks recent folder\My labs\Remote sensing labs\Lab6\Lab_6_Data.jpg");
imshow(I)
%% Applying stretching to image
J = imadjust(I,stretchlim(I),[]);
figure
imshow(J);
figure
subplot(1,2,1), imshow(I), title('Original image')
subplot(1,2,2), imshow(J), title('Linear stretched image');
%% Applying 3x3 average filder
h = fspecial('average',3);
filteredI = imfilter(I, h);
imshow(filteredI);
figure
subplot(1,2,1), imshow(I), title('Original image')
subplot(1,2,2), imshow(filteredI), title('Average filtered image');
%% Applying 9x9 filter
h2 = fspecial('average',9);
filteredI2 = imfilter(I, h2);
imshow(filteredI2);
figure
subplot(1,2,1), imshow(I), title('Original image')
subplot(1,2,2), imshow(filteredI2), title('Average filtered image');

%% Applying 5x5 median filter
Ir = I(:,:,1); 
Ig = I(:,:,2); 
Ib = I(:,:,3);
medianIr = medfilt2(Ir,[5 5]);
medianIg = medfilt2(Ig,[5 5]);
medianIb = medfilt2(Ib,[5 5]);
Medf(:,:,1)=medianIr;
Medf(:,:,2)=medianIg;
Medf(:,:,3)=medianIb;
figure, imshow(Medf);
figure
subplot(1,2,1), imshow(I), title('Original image')
subplot(1,2,2), imshow(Medf), title('Median filtered image (5*5)');
%% Applying 9x9 median filter

medianIr2 = medfilt2(Ir,[9 9]);
medianIg2 = medfilt2(Ig,[9 9]);
medianIb2 = medfilt2(Ib,[9 9]);
Medf2(:,:,1)=medianIr2;
Medf2(:,:,2)=medianIg2;
Medf2(:,:,3)=medianIb2;
figure, imshow(Medf2);
figure
subplot(1,2,1), imshow(I), title('Original image')
subplot(1,2,2), imshow(Medf2), title('Median filtered image (9*9)');
%% Histogram equalization and high pass filter-
Irhist = histeq(Ir);
Ighist = histeq(Ig);
Ibhist = histeq(Ib);
Hist_equalized(:,:,1)=Irhist;
Hist_equalized(:,:,2)=Ighist;
Hist_equalized(:,:,3)=Ibhist;

figure, imshow(Hist_equalized);

%Horizontal high pass Filtering 
DelH = [1 -1];
Ix = imfilter(Hist_equalized,DelH);
figure,imshow(Ix);
figure,
subplot(1,2,1), imshow(I),title('Original Image')
subplot(1,2,2), imshow(Ix),title('Horizontal high Pass filtered Image');

% Vertical high pass filtering
DelV = [1 -1]';
Iy = imfilter(Hist_equalized,DelV);
figure,imshow(Iy);
figure,
subplot(1,2,1), imshow(I),title('Original Image')
subplot(1,2,2), imshow(Iy),title('Vertical high Pass filtered Image');
%% Experimenting with fspecial-
%Motionblur
f1 = fspecial('motion');
MotionBlur = imfilter(I,f1,'replicate');
figure,imshow(MotionBlur);

%Disc-
f2 = fspecial('disk',10);
blurred = imfilter(I,f2,'replicate'); 
figure,imshow(blurred);

%prewitt filter- Horizontal
f3 = fspecial('prewitt');
myprewitt1=imfilter(I,f3);
figure,imshow(myprewitt1),title('Prewitt filtered horizontal');

%prewitt filter- Vertical
f4 = f3';
myprewitt2=imfilter(I,f4);
figure,imshow(myprewitt2),title('Prewitt filtered vertical');

%sobel filter- Horizontal
f5 = fspecial('sobel');
mysobel1=imfilter(I,f5);
figure,imshow(mysobel1),title('Sobel filtered horizontal');

%sobel filter- Vertical
f6 = f5';
mysobel2=imfilter(I,f6);
figure,imshow(mysobel2),title('Sobel filtered vertical');







