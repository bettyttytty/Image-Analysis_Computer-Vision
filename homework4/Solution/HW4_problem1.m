clear;clc;
imrd=imread('Connected.bmp');
[row, col]=size(imrd);
% subplot(2,2,1);
% imshow(im);
% title('Original Image');
% 
%% Histogram
h=histogram(imrd);
% subplot(2,2,2);
% plot(h);
% title('Image Histogram');
%% Threshold
for i=1:row
    for j=1:col
        if imrd(i,j)<100
            im(i,j)=0;
        else
            im(i,j)=255;
        end
    end
end
im=uint8(im);
% subplot(3,2,3);
imshow(im);
title('Image after Thresholding');
%% find connected component
flag=1;
count=[];
label=zeros(row,col);
x=0;
for i=1:row
    for j=1:col
        if im(i,j)==0
            if im(i,j-1)==255&&im(i-1,j)==255
                count=[count,flag];
                label(i,j)=count(x+1);
                flag=flag+1;
                x=x+1;
                continue;
            end
            if im(i,j-1)==255&&im(i-1,j)==0
                label(i,j)=count(label(i-1,j));
                continue;
            end
            if im(i,j-1)==0&&im(i-1,j)==255
                label(i,j)=count(label(i,j-1));
                continue;
            end
            if im(i,j-1)==0&&im(i-1,j)==0
                label(i,j)=label(i-1,j);
                for k=1:x
                    if count(k)==count(label(i,j-1))
                        count(k)=count(label(i-1,j));
                    end
                end
                continue;
            end
        end    
    end
end

component=unique(count)
len=size(component)
output=zeros(row,col);
for i=1:row
    for j=1:col
        if label(i,j)==0
            output(i,j)=0;
        else
        output(i,j)=count(label(i,j));
        end
    end
end
for i=1:row
    for j=1:col
        if label(i,j)==0
            output(i,j)=0;
        else
        output(i,j)=count(label(i,j));
        end
    end
end
for i=1:row
    for j=1:col
        for k=1:len(2)
            if output(i,j)==component(k)
                output(i,j)=k;
            end
        end
    end
end

for k=0:len(2)
    for i=1:row
        for j=1:col
            if output(i,j)==k
                output(i,j)=-255/len(2)*(k-3);
            end
        end
    end
end

output=uint8(output);
subplot(2,2,3);
imshow(output);
title('Component Plot');