clc;
clear;
close all;

%% Read Image
img = imread('cameraman.tif');
[rows, cols] = size(img);

%% Initialize Histogram
histogram1 = zeros(256, 1);

%% Compute Histogram of Original Image
for i = 1:rows
    for j = 1:cols
        gray_val = img(i, j);
        histogram1(gray_val + 1) = histogram1(gray_val + 1) + 1;
    end
end

%% Compute CDF (Cumulative Distribution Function)
cdf = cumsum(histogram1) / (rows * cols);

%% Perform Histogram Equalization
new_img = zeros(size(img));

for i = 1:rows
    for j = 1:cols
        gray_val = img(i, j);
        new_gray_val = round(255 * cdf(gray_val + 1));
        new_img(i, j) = new_gray_val;
    end
end

%% Compute Histogram of Equalized Image
histogram2 = zeros(256, 1);

for i = 1:rows
    for j = 1:cols
        gray_val = new_img(i, j);
        histogram2(gray_val + 1) = histogram2(gray_val + 1) + 1;
    end
end

%% Display Original Image
figure;
imshow(img);
title('Original Image');

%% Display Equalized Image
figure;
imshow(uint8(new_img));
title('Equalized Image');

%% Display Histograms
figure;
bar(0:255, histogram1);
title('Histogram of Original Image');

figure;
bar(0:255, histogram2);
title('Histogram of Equalized Image');
