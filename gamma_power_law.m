clc;
clear;
close all;

img = imread('peppers.png');
img = im2double(img);
gamma_c_image = img;

[m, n, k] = size(img);

gamma = input('gamma: ');
c = input('c: ');

for i = 1:m
    for j = 1:n
        r = double(img(i, j, 1));
        g = double(img(i, j, 2));
        b = double(img(i, j, 3));
        r = c * (r.^gamma);
        g = c * (g.^gamma);
        b = c * (b.^gamma);
        gamma_c_image(i, j, 1) = r;
        gamma_c_image(i, j, 2) = g;
        gamma_c_image(i, j, 3) = b;
    end
end

figure;

subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(gamma_c_image);
title('Output Image');
