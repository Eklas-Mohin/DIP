img = imread('peppers.png');

img = im2double(img);

log_transformed_img = img;

[m, n, k] = size(img);

c = input('Enter scalling constant:');
% log_transformed_img = c * log(1 + img_double);

for i = 1:m
    for j = 1:n
        r = double(img(i, j, 1));
        g = double(img(i, j, 2));
        b = double(img(i, j, 3));
        log_transformed_img(i, j, 1) = c * log(1 + r);
        log_transformed_img(i, j, 2) = c * log(1 + g);
        log_transformed_img(i, j, 3) = c * log(1 + b);
    end
end

figure;

subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(log_transformed_img);
title('Log Transformed Image');
