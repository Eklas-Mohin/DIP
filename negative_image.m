clc;
clear;
close all;

img = imread('peppers.png');

[m, n, c] = size(img);

neg_img = zeros(m, n);

for i = 1:m
    for j = 1:n

        r = double(img(i, j, 1));
        g = double(img(i, j, 2));
        b = double(img(i, j, 3));

        gray_val = r * 0.2989 + g * 0.5870 + b * 0.1140;
        neg_img(i, j) = 255 - gray_val;

    end
end

figure;

subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(neg_img));
title('Negative Image');