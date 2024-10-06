clc;
clear;
close all;

img = imread('peppers.png');

threshold = 128;

[m, n, c] = size(img);

gray_img = zeros(m, n);
mono_img = zeros(m, n);

for i = 1:m
    for j = 1:n
    
        r = double(img(i, j, 1));
        g = double(img(i, j, 2));
        b = double(img(i, j, 3));

        gray_value = 0.2989 * r + 0.5870 * g + 0.1140 * b;
        gray_img(i, j) = gray_value;
        
        if gray_value >= threshold
            mono_img(i, j) = 255;
        else
            mono_img(i, j) = 0;
        end
    end
end

figure;

subplot(1, 3, 1);
imshow(img);
title('Original Image');

subplot(1, 3, 2);
imshow(uint8(gray_img));
title('Grayscale Image');

subplot(1, 3, 3);
imshow(uint8(mono_img));
title('Monochrome Image (B&W)');
