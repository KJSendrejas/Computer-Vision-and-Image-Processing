im = imread('pout.tif');
figure(1), imshow(im), title('Figure 1. Original Image'); % Read grayscale image
figure(2), imhist(im), axis tight, title('Figure 2. Histogram of Original Image');


full_range_adj = imadjust(im); % Automatic full range stretching
figure(3), imshow(full_range_adj), title('Figure 3. Increased Contrast Image');
figure(4), imhist(full_range_adj), axis tight, title('Figure 4. Stretched Histogram');

im2 = imread('cameraman.tif');
figure(5), imshow(im2), title('Figure 5. Original Image');
figure(6), imhist(im2), title('Figure 6. Histogram of Original Image');

% Decrease contrast
adj_image = imadjust(im2, [0 0.2], [0.5 1]);
figure(7), imshow(adj_image), title('Figure 7. Adjusted Image');
figure(8), imhist(adj_image), title('Figure 8. Histogram of Adjusted Image');

% --- Increase contrast ---
im3 = imread('cameraman.tif');
high_contrast = imadjust(im3, [0.3 0.7], [0 1]); % Stretch middle range fully
figure(9), imshow(high_contrast), title('Figure 9. Increased Contrast Image');
figure(10), imhist(high_contrast), title('Figure 10. Histogram of Increased Contrast Image');


im4 = imread('tire.tif');

% Original
figure(11), imshow(im4), title('Figure 11. Original Image');
figure(12), imhist(im4), title('Figure 12. Histogram of Original Image');

% Gamma < 1
adj_gamma = imadjust(im4, [], [], 0.5);
figure(13), imshow(adj_gamma), title('Figure 13. Gamma < 1');
figure(14), imhist(adj_gamma), title('Figure 14. Histogram of Gamma < 1');
figure(15), plot(im4(:), adj_gamma(:), '.'), axis tight, title('Figure 15. Gamma < 1 Plot');

% Gamma > 1
adj_gamma = imadjust(im4, [], [], 1.5);
figure(16), imshow(adj_gamma), title('Figure 16. Gamma > 1');
figure(17), imhist(adj_gamma), title('Figure 17. Histogram of Gamma > 1');
figure(18), plot(im4(:), adj_gamma(:), '.'), axis tight, title('Figure 18. Gamma > 1 Plot');

% Gamma = 1
adj_gamma = imadjust(im4, [], [], 1);
figure(19), imshow(adj_gamma), title('Figure 19. Gamma = 1');
figure(20), imhist(adj_gamma), title('Figure 20. Histogram of Gamma = 1');
figure(21), plot(im4(:), adj_gamma(:), '.'), axis tight, title('Figure 21. Gamma = 1 Plot');

function out = histpwl(im, a, b)
% HISTPWL  Piecewise linear intensity transformation
%   out = histpwl(im, a, b)
%
%   im : input image (uint8 or double)
%   a  : input breakpoints (0–1)
%   b  : output breakpoints (0–1)

classChanged = 0;
if ~isa(im, 'double')
    classChanged = 1;
    im = im2double(im);
end

if length(a) ~= length(b)
    error('Vectors A and B must be of equal size');
end

N = length(a);
out = zeros(size(im));

for i = 1:N-1
    pix = find(im >= a(i) & im < a(i+1));
    out(pix) = (im(pix) - a(i)) * ...
               (b(i+1) - b(i)) / (a(i+1) - a(i)) + b(i);
end

pix = find(im == a(N));
out(pix) = b(N);

if classChanged == 1
    out = uint8(255*out);
end
end

im5 = imread('forest.tif');

% Unadjusted version
unadj_im = histpwl(im5, [0 1], [0 1]);
figure(22), imshow(im5), title('Figure 22. Original Image');
figure(23), plot(im5(:), unadj_im(:), '.'), axis tight, title('Figure 23. Plot of Original Image');

% Piecewise linear stretching
stretch_im = histpwl(im5, [0 0.25 0.5 0.75 1], [0 0.75 0.25 0.5 1]);
figure(24), imshow(stretch_im), title('Figure 24. Piecewise Linear Stretched Image');
figure(25), plot(im5(:), stretch_im(:), '.'), axis tight, title('Figure 25. Plot of Piecewise Linear Stretched Image');

im6 = imread('forest.tif');
figure(26), imshow(im6), title('Figure 26. Original Image');
figure(27), imhist(im6), axis tight, title('Figure 27. Histogram of Original Image');

eq_im = histeq(im6);
figure(28), imshow(eq_im), title('Figure 28. Equalized Image');
figure(29), imhist(eq_im), axis tight, title('Figure 29. Histogram of Equalized Image');

% --- Given data ---
i = 0:7;                       % Gray levels
ni = [125 40 80 0 0 0 10 35];  % Frequencies
n = sum(ni);

% --- Compute equalized levels ---
cdf = cumsum(ni);
equalized_vals = round(7 * cdf / n);  % L-1 = 7 for 3-bit image

% --- Display table ---
disp(' i     ni     CDF     New Gray');
disp([i' ni' cdf' equalized_vals']);

% --- Plot histograms ---
figure(30)
bar(i, ni), xlabel('Gray Level'), ylabel('Count'), ...
    title('Figure 30. Original Histogram (0–7)');

% New histogram (remap counts)
new_hist = zeros(1,8);
for k = 1:length(i)
    new_hist(equalized_vals(k)+1) = new_hist(equalized_vals(k)+1) + ni(k);
end

figure(31)
bar(0:7, new_hist), xlabel('Equalized Gray Level'), ylabel('Count'), ...
    title('Figure 31. Equalized Histogram (0–7)');

