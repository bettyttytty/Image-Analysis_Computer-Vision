clear;clc;
im=imread('Image.bmp');
[row col]=size(im);
imd=double(im);
countleft=0;
countright=0;
h1=histogram(im);
t=0.05*row*col;
for i=1:256
    countleft=countleft+h1(i);
    if countleft>=t
        break
    else
        continue
    end
end

for j=256:-1:1
    countright=countright+h1(j);
    if countright>=t
        break
    else
        continue
    end
end
output=double(zeros(row,col));

for m=1:row
    for n=1:col
        if im(m,n)<=i
            output(m,n)=0;
        else
            if im(m,n)>=j
                output(m,n)=255;
            else
                output(m,n)=(imd(m,n)-i)/(j-i)*255;
            end
        end
    end
end
output=uint8(output);

subplot(2,2,1);
imshow(im);
title('Original Image');
subplot(2,2,2);
plot(h1);
title('Original Image Histogram');
subplot(2,2,3);
imshow(output);
title('Image after Contrast Stretching');
subplot(2,2,4);
h2=histogram(output);
plot(h2);
title('Contrast Stretching Image Histogram');