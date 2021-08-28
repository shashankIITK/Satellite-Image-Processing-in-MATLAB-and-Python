%% Reading and displaying given image.
I = imread("D:\Shashanks recent folder\My labs\Remote sensing labs\HA1\ha1.png");
I1 = rgb2gray(I);
figure,imshow(I1);
title('Original Image');
figure
imhist(I1);
%% Code for histogram equalization.
Npixels=size(I1,1)*size(I1,2);

% Creating empty arrays of 256 elements-
Iheq = zeros(size(I1));

DN_freq=zeros(256,1);

DN_C_freq=zeros(256,1);

DN_prob=zeros(256,1);

DN_Cprob=zeros(256,1);

OutputImg=zeros(256,1);

%Loop for creating array containing DN number frequency.
for ii=1:size(I1,1)

    for jj=1:size(I1,2)

        pixel=I1(ii,jj);

        DN_freq(pixel+1)=DN_freq(pixel+1)+1;

        %probf(pixel+1)=DN_freq(pixel+1)/Npixels;

    end

end

%Loop for creating array containing cumulative frequency value of
%particular DN in original image.
for i=1:size(DN_prob)
    DN_prob(i)=DN_freq(i)/Npixels;


end

sum=0;

N=255;


%Loop for calculating probability of DN value and cumulative distribution probability. 

for p=1:size(DN_Cprob)

   sum=sum+DN_freq(p);

   DN_C_freq(p)=sum;
   
   DN_Cprob(p)=DN_C_freq(p)/Npixels;

   OutputImg(p)=round(DN_Cprob(p)*N);


end

% Loop for assigning cumulative probability value of particular DN to
% respective DN of original image and creating new image after scaling.
for q=1:size(I1,1)

    for r=1:size(I1,2)

            Iheq(q,r)=OutputImg(I1(q,r)+1);

    end

end

% Displaying resulting images-
I2 = histeq(I1);
figure()
subplot(1,2,1)
imshow(I2,[])
title('Histeq function applied image')
subplot(1,2,2)
imshow(Iheq,[])
title('Program applied histogram equilized image')

figure
imhist(I2);
figure
imhist(uint8(Iheq));

figure,imshow(I1);
title('Original Image');

figure,imshow(I2);
title('histeq function applied Image');

figure,imshow(uint8(Iheq));
title('Program Histogram equalized Image');




%% Displaying frequency of DN and cumulative DN frequency plot for original image.
x=zeros(256,1);
for id=1:size(x)
    x(id)=id-1;


end
figure
plot(x,DN_freq),xlabel('DN(0-255)'), ylabel('pixel frequency'), title('DN frequency plot'),grid on;
figure
plot(x,DN_C_freq),xlabel('DN(0-255)'), ylabel('pixel frequency'), title('cumulative frequency plot'),grid on;

%% Displaying frequency of DN and cumulative DN frequency plot for histogram equalized image.

Iheq2= uint8(Iheq);
DN_freq2=zeros(256,1);

DN_C_freq2=zeros(256,1);

%Loop for creating array containing DN number frequency.
for t=1:size(Iheq2,1)

    for u=1:size(Iheq2,2)

        pixel2=Iheq2(t,u);

        DN_freq2(pixel2+1)=DN_freq2(pixel2+1)+1;

        %probf(pixel+1)=DN_freq(pixel+1)/Npixels;

    end

end

%Loop for creating array containing cumulative frequency value of
%particular DN in histogram equalized image.


sum2=0;

N2=255;


%Loop for calculating probability of DN value and cumulative distribution probability. 

for v=1:size(DN_C_freq2)

   sum2=sum2+DN_freq2(v);

   DN_C_freq2(v)=sum2;
   
   


end
figure
plot(x,DN_freq2),xlabel('DN(0-255)'), ylabel('pixel frequency'), title('DN frequency plot of histogram equalized image'),grid on;
figure
plot(x,DN_C_freq2),xlabel('DN(0-255)'), ylabel('pixel frequency'), title('cumulative frequency plot of histogram equalized image'),grid on;





