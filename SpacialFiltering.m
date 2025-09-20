image=imread('cameraman.tif');
if size(image,3)==3
    image=rgb2gray(image);
end

smooth_kernel = [1 1 1; 1 1 1; 1 1 1]/9;
edge_kernel = [0 -1 -1; -1 4 -1; 0 -1 -1];
sharp_kernel = [0 -1 0; -1 5 -1; 0 -1 0];

smooth_image = imfilter(image, smooth_kernel, 'replicate');
edge_image = imfilter(image, edge_kernel, 'replicate');
sharp_image = imfilter(image, sharp_kernel, 'replicate');

%figure;
%subplot(2,2,1), imshow(image), title('Original Image');
%subplot(2,2,2), imshow(smooth_image), title('Smoothed Image');
%subplot(2,2,3), imshow(edge_image), title('Edge Detected Image');
%subplot(2,2,4), imshow(sharp_image), title('Sharpened Image');

combination = imfilter(smooth_image,sharp_kernel,'replicate');
figure(3), imshow(combination), title('Smoothed then Sharpened Image');

%low pass filter -> smooth
%high pass filter -> edge detection, sharpening
%low frequency components -> smooth areas gradient
%high frequency components -> checkerboard + noise
%uses odd numbered kernels to attack center pixel

%Frequencies and Gaussian Filters
%laplacian filers high pass filters
%gaussian filters low pass filters
%combination of low pass and high pass filters -> band pass filters
%band pass filters -> edge detection, sharpening

%unscaled laplacian filter
%handling out of range values
%Applications, edge detection, image enhancement, feature extraction
%Laplacian of Gaussian (LoG) filter
%Difference of Gaussian (DoG) filter

%Gaussian filter
%standard deviation controls the amount of blurring
%larger std -> more blurring

%2D Gaussian function
%3x3 kernel vs 9x9 kernel
%larger kernel -> more blurring

c = imread('cameraman.tif');
af = fspecial('gaussian', [15 15], 5);
f=filter2(af, c);
figure(4), imshow(f/255);

    
