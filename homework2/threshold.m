clear;clc;
im=imread('Image.bmp');
[row col]=size(im);
subplot(2,2,1);
imshow(im);
title('Original Image');
%% Histogram
h=histogram(im);
subplot(2,2,2);
plot(h);
title('Image Histogram');
%% Thresholding
for i=1:row
    for j=1:col
        if im(i,j)<40
            output(i,j)=0;
        else
            output(i,j)=255;
        end
    end
end
output=uint8(output);
h2=histogram(output);
subplot(2,2,3);
imshow(output);
title('Image after Thresholding');
subplot(2,2,4);
plot(h2);
