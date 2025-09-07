p=imread('resources/cameraman.tif');
figure(1), imshow(p);
title('Original Image');
figure(2), imhist(p), axis tight, title('Histogram of Original Image');

%Limiters [low_in high_in] to [low_out high_out] output will be normalized to [0 1].
%limiter=min_pix_val / 255
p_adjust=imadjust(p, [0.4 0.5], [0 1]);
title('Image after imadjust with [0.3 0.7] to [0 1]');
figure(3), imshow(p_adjust);
figure(4), imhist(p_adjust), axis tight, title('Histogram of Adjusted Image');

%Auto distribution of pixel values
p_adjust2=histeq(p);
figure(5), imshow(p_adjust2);
figure(6), imhist(p_adjust2), axis tight, title('Histogram of Histogram Equalized Image');

%Specify the bins for histogram equalization
p_adjust3=histeq(p, [0 0.4 0.5 1]);
figure(7), imshow(p_adjust3); 
figure(8), imhist(p_adjust3), axis tight, title('Histogram of Histogram Equalized Image with specified bins');

%Threasholding - Image Segmentation
imgthresh=imread('resources/galaxy.png');
figure(9), imshow(imgthresh);
title('Original Image of Galaxy');
figure(10), imhist(imgthresh), axis tight, title('Histogram of Galaxy Image');

%Manual Thresholding
galax=rgb2gray(imgthresh);
tresh_val=galax>30; %Threshold value can be changed to see the effect
figure(11), imshow(tresh_val); 