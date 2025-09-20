image=imread('cameraman.tif');
af=fspecial('average', 3); %'laplacian', 'gaussian', 'log', 'motion'
f=filter2(af, image);
df=f/255;
figure(1), imshow(df);


af2=fspecial('log', 5);
f2=filter2(af2, image);
figure(2), imshow(f2);