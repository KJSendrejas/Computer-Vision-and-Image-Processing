c=imread('resources/caribou.tif');
figure(1), imshow(c)

double_c=im2double(c);
figure(2), imshow(double_c)

figure(3), imshow(cd/255);

figure(3), imshow(cd/512);

figure(4), imshow(cd/128);

c2=uint8(255*double_c);
figure(5), imshow(c2);

%c3=im2unint8(double_c);
%figure(6), imshow(c3);

cl=c>120;
figure(7), imshow(cl);
title('Logical Image');


cdouble=double(c);
c0=mod(cdouble,2);
figure(8), imshow(c0);
c1=mod(floor(cdouble/2),2);
figure(9), imshow(c1);
c2=mod(floor(cdouble/4),2);
figure(10), imshow(c2);
c3=mod(floor(cdouble/8),2);
figure(11), imshow(c3);
c4=mod(floor(cdouble/16),2);
figure(12), imshow(c4);
c5=mod(floor(cdouble/32),2);
figure(13), imshow(c5);
c6=mod(floor(cdouble/64),2);
figure(14), imshow(c6);
c7=mod(floor(cdouble/128),2);
figure(15), imshow(c7);

resize=imresize(imresize(c,1/32), 32);
figure(16), imshow(resize);
title('Image after resizing by factor of 1/32 and then 32');
