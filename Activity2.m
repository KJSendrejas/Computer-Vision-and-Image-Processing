y=imread('cameraman.tif');
figure(1),imshow(y);
title('Original Image');

Add_y=imadd(y,128);
figure(2),imshow(Add_y);
title('Image after adding 128');

Sub_y=imsubtract(y,128);
figure(3),imshow(Sub_y);
title('Image after subtracting 128');

Mul_y=immultiply(y,2);
figure(4),imshow(Mul_y);
title('Image after multiplying by 2');

Div_y=imdivide(y,2);
figure(5),imshow(Div_y);
title('Image after dividing by 2');

I = [3 148 117 148 145 178 132 174;
     2 176 174 110 185 155 118 165;
     0 100 124 113 193 136 146 108;
     0 155 170 106 158 130 178 170;
     9 196 138 113 108 127 144 139;
     6 188 143 183 137 162 105 169;
     9 122 156 119 188 179 100 151;
     8 176 137 114 135 123 134 183];

I = uint8(I);


T1 = I >= 100;  
T1 = uint8(T1 * 255); 


T2 = I >= 150; 
T2 = uint8(T2 * 255);

figure;
subplot(1,3,1), imshow(I), title('Original Image');
subplot(1,3,2), imshow(T1), title('Threshold at 100');
subplot(1,3,3), imshow(T2), title('Threshold at 150');