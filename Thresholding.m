% Read the mango image and convert to grayscale
mango = imread('resources/mango.jpg'); % or appropriate filename
mango_gray = rgb2gray(mango); % Convert to grayscale
mango = im2double(mango_gray); % Convert to double for processing

% a. Add 100 to pixel values
mango_add = mango + 100/255;
mango_add = min(mango_add, 1); % Prevent values above 1
figure(1), subplot(2,2,1), imshow(mango_add), title('Add 100 to Pixel Values')
subplot(2,2,2), imhist(mango_add), title('Histogram - Add 100')
axis tight

% b. Subtract 50 from pixel values
mango_sub = mango - 50/255;
mango_sub = max(mango_sub, 0); % Prevent negative values
figure(2), subplot(2,2,1), imshow(mango_sub), title('Subtract 50 from Pixel Values')
subplot(2,2,2), imhist(mango_sub), title('Histogram - Subtract 50')
axis tight

% c. Multiply by 0.5 and 2.5
mango_mult1 = mango * 0.5;
mango_mult2 = mango * 2.5;
mango_mult2 = min(mango_mult2, 1); % Clip to maximum 1

figure(3), 
subplot(2,2,1), imshow(mango_mult1), title('Multiply by 0.5')
subplot(2,2,2), imhist(mango_mult1), title('Histogram - Multiply 0.5')
axis tight
subplot(2,2,3), imshow(mango_mult2), title('Multiply by 2.5')
subplot(2,2,4), imhist(mango_mult2), title('Histogram - Multiply 2.5')
axis tight

% d. Divide by 0.007
mango_div = mango / 0.007;
mango_div = min(mango_div, 1); % Clip to maximum 1
figure(4), 
subplot(1,2,1), imshow(mango_div), title('Divide by 0.007')
subplot(1,2,2), imhist(mango_div), title('Histogram - Divide by 0.007')
axis tight

% Display original image and histogram for comparison
figure(5),
subplot(1,2,1), imshow(mango), title('Original Grayscale Image')
subplot(1,2,2), imhist(mango), title('Original Histogram')
axis tight

parking = imread('resources/parking.jpg');
parking_gray = rgb2gray(parking); % Convert to grayscale
parking = im2double(parking_gray); % Convert to double for processing

figure, imshow(parking), title('Original Image');

heq = histeq(parking);
figure, imshow(heq), title('Histogram Equalization');
figure, imhist(heq), title('Histogram (Equalized)');

comp_img = imcomplement(parking);
figure, imshow(comp_img), title('Complement Image');
figure, imhist(comp_img), title('Histogram (Compliment)');

linear = imadjust(parking, stretchlim(parking), []);
figure, imshow(linear), title('Linear Stretching');
figure, imhist(linear), title('Histogram (Linear Stretching)');


piece = zeros(size(parking));

r1 = parking <= 85;
r2 = parking > 85 & parking <= 170;
r3 = parking > 170;

piece(r1) = uint8((parking(r1)/85) * 100);
piece(r2) = uint8(100 + ((parking(r2) - 85) / 85) * 100);
piece(r3) = uint8(200 + ((parking(r3) - 170) / 85) * 55);

figure, imshow(piece), title('Piecewise Stretching');
figure, imhist(piece), title('Histogram (Piecewise Stretching)');

parking_double = double(parking);
c = 255 / log(1 + max(parking_double(:)));
log_stretch = uint8(c * log(1 + parking_double));
figure, imshow(log_stretch), title('Logarithmic Stretching');
figure, imhist(log_stretch), title('Histogram (Logarithmic Stretching)');

gamma015 = im2uint8(mat2gray(parking) .^ 0.15);
gamma115 = im2uint8(mat2gray(parking) .^ 1.15);

figure, imshow(gamma015), title('Gamma = 0.15 (Bright)');
figure, imshow(gamma115), title('Gamma = 1.15 (Slightly Darker)');
figure, imhist(gamma015), title('Gamma = 0.15');
figure, imhist(gamma115), title('Gamma = 1.15');


level = graythresh(parking);
otsu = imbinarize(parking, level);
figure, imshow(otsu), title('Otsu Thresholding');

fixed = parking > 120;
figure, imshow(fixed), title('Fixed Threshold = 120');

adaptive = imbinarize(parking, 'adaptive');
figure, imshow(adaptive), title('Adaptive Thresholding');

local = adaptthresh(parking, 0.5);
local_bin = imbinarize(parking, local);
figure, imshow(local_bin), title('Local Thresholding');