x=imread('cameraman.tif');
y=imread('cameraman.jpg');
z=imread('cameraman.png');
w=imread('cameraman.bmp');
%imwrite(x, 'cameraman.jpg');
%imwrite(x, 'cameraman.png');
%imwrite(x, 'cameraman.bmp');

%disp(imfinfo(x));
%disp(imfinfo(y));
%disp(imfinfo(z));
%disp(imfinfo(w));

bwtif = im2bw(x, 0.5);
bwjpg = im2bw(y, 0.5);
bwpng = im2bw(z, 0.5);
bwbmp = im2bw(w, 0.5);
figure(1), imshow(bwtif), title('Original Image');
figure(2), imshow(bwjpg), title('Black and White Image');
figure(3), imshow(bwpng), title('Black and White Image');
figure(4), imshow(bwbmp), title('Black and White Image');

rgbtif = rgb2ind(cat(3,x,x,x), 64);
rgbjpg = rgb2ind(cat(3,y,y,y), 64);
rgbpng = rgb2ind(cat(3,z,z,z), 64);
rgbbmp = rgb2ind(cat(3,w,w,w), 64);

figure(5), imshow(rgbtif, jet(64)), title('Indexed Image');
figure(6), imshow(rgbjpg, jet(64)), title('Indexed Image');
figure(7), imshow(rgbpng, jet(64)), title('Indexed Image');
figure(8), imshow(rgbbmp, jet(64)), title('Indexed Image');

rgbtif = cat(3, x, x, x);
rgbjpg = cat(3, y, y, y);
rgbpng = cat(3, z, z, z);
rgbbmp = cat(3, w, w, w);
figure(9), imshow(rgbtif), title('RGB Image');
figure(10), imshow(rgbjpg), title('RGB Image');
figure(11), imshow(rgbpng), title('RGB Image');
figure(12), imshow(rgbbmp), title('RGB Image');

tif_img = imread('cameraman.tif');  
gray = im2gray(tif_img);          
figure(13), imshow(gray), title('Gray Image');

uint8_img = im2uint8(gray);
figure(14), imshow(uint8_img), title('uint8 Image');