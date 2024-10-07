clc;
close all;
clear all;

img = imread('Image/Birds.jpg');
figure(1)
imshow(img)
title('Original Image')

z = 0.5;

[width, height, p] = size(img);
new_width = floor(width*z);
new_height = floor(height*z);

for i = 1:new_width
    for j = 1:new_height
        new_img(i, j, :) = img(ceil(i/z), ceil(j/z), :);
    end
end

figure(2);
imshow(new_img);
