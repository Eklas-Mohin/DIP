clc;
clear;
close all;

im = imread('peppers.png');
figure(1);
imshow(im);
title('Original Image');

img = double(im);

bits = 8;
bit_planes = cell(1, 8);

for i = 1:bits
    bit_planes{i} = img - 2 * floor(img / 2);
    img = floor(img / 2);
    figure(i + 1);
    imshow(bit_planes{i});
    title(sprintf('Bit Plane: %g', i));
end

re_img = zeros(size(img));

for i = 1:bits
    re_img = re_img + bit_planes{i} * 2^(i - 1);
end

figure;

re_img = uint8(re_img);
imshow(re_img);
