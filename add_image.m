clc;
clear;
close all;

% Both images needs to be grayscale image
% Both images needs to have the same dimension

img1 = imread('cameraman.tif');
img2 = imread('rice.png');

[m, n] = size(img1);

sub_img = zeros(m, n);

for i = 1:m
    for j = 1:n
        sub_img(i, j) = img1(i, j) + img2(i, j);
    end
end

figure;

subplot(1, 3, 1);
imshow(img1);
title('Image 1');

subplot(1, 3, 2);
imshow(img2);
title('Image 2');

subplot(1, 3, 3);
imshow(uint8(sub_img));
title('Subtracted Image');
