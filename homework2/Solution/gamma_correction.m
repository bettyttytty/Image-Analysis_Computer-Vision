clear;clc;
im=imread('Image.bmp');
imd=double(im);
[row col]=size(imd);
%gamma=0.5
gamma1=0.5;
out1=abs((1*imd).^gamma1);
maxm1=max(out1(:));
minm1=min(out1(:));
for j=1:row
	for k = 1:col
        out1(j,k)=(255*out1(j,k))/(maxm1-minm1);
	end
end
out1=uint8(out1);

%gamma=1.0
gamma2=1.0;
out2=abs((1*imd).^gamma2);
maxm2=max(out2(:));
minm2=min(out2(:));
for j=1:row
	for k = 1:col
        out2(j,k)=(255*out2(j,k))/(maxm2-minm2);
	end
end
out2=uint8(out2);

%gamma=2.0
gamma3=2.0;
out3=abs((1*imd).^gamma3);
maxm3=max(out3(:));
minm3=min(out3(:));
for j=1:row
	for k = 1:col
        out3(j,k)=(255*out3(j,k))/(maxm3-minm3);
	end
end
out3=uint8(out3);

subplot(2,2,1);
imshow(im);
title('Original Image');
subplot(2,2,2);
imshow(out1);
title('Gamma=0.5');
subplot(2,2,3);
imshow(out2);
title('Gamma=1.0');
subplot(2,2,4);
imshow(out3);
title('Gamma=2.0');