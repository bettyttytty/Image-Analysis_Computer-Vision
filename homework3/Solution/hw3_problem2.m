clear;clc;
im=imread('bottle.bmp');
[row, col]=size(im);
% subplot(3,2,1);
% imshow(im);
title('Original Image');
%% Histogram
h=histogram(im);
% subplot(3,2,2);
% plot(h);
title('Image Histogram');

%% Threshold
for i=1:row
    for j=1:col
        if im(i,j)<100
            output(i,j)=0;
        else
            output(i,j)=255;
        end
    end
end
output=uint8(output);
h2=histogram(output);
% subplot(3,2,3);
% imshow(output);
title('Image after Thresholding');

%% Dilation
dout=[255*ones(1,col);output;255*ones(1,col)];
dout=[255*ones(row+2,1) dout 255*ones(row+2,1)];
%dout=output(1:row-2,1:col-2);
dkernel=[0 1 0
        1 1 1
        0 1 0];
[drow,dcol]=size(dkernel);
for m=1:10
    for i=1:row
        for j=1:col
            sum=0;
            for k=1:drow
                for l=1:dcol
                    if dout(i-1+k,j-1+l)==0
                        sum=sum+1*dkernel(4-k,4-l);
                    end
                end
            end
            if sum>=1
                dout(i,j)=0;
            else dout(i,j)=255;
            end
        end
    end
end
dout=dout(1:row,1:col);
dout=uint8(dout);
% subplot(3,2,5);
% imshow(dout);
title('Image after Dilation');


%% Erosion
eout=[255*ones(1,col);dout;255*ones(1,col)];
eout=[255*ones(row+2,1) eout 255*ones(row+2,1)];
kernel=[0 1 0
        1 1 1
        0 1 0];
[krow,kcol]=size(kernel);

for m=1:10
    for i=1:row
        for j=1:col
            sum=0;
            for k=1:krow
                for l=1:kcol
                    if eout(i-1+k,j-1+l)==0
                        sum=sum+1*kernel(4-k,4-l);
                    end
                end
            end
            if sum>=5
                eout(i,j)=0;
            else eout(i,j)=255;
            end
        end
    end
end
eout=eout(1:row,1:col);
eout=uint8(eout);
% subplot(3,2,4);
% imshow(eout);

title('Image after Erosion');

%% Two pass algorithm
max=0; % maximum value of the distance transform
count=0;%number of maximum value
area=0;
cx=0;
cy=0;
disim=[255*ones(1,col);eout;255*ones(1,col)];
disim=[255*ones(row+2,1) disim 255*ones(row+2,1)];
for i=1:row+2
    for j=1:col+2
        if disim(i,j)==255
            disim(i,j)=0;
        else disim(i,j)=1;
        end
    end
end
for i=2:row+1
    for j=2:col+1
        if disim(i,j)==0
            continue
        else
            disim(i,j)=min(1+disim(i,j-1),1+disim(i-1,j));
        end
    end
end
for i=row+1:-1:2
    for j=col+1:-1:2
        if disim(i,j)==0
            continue
        else
            area=area+1;
            disim(i,j)=min(min(1+disim(i,j+1),1+disim(i+1,j)),disim(i,j));
            if disim(i,j)>max
                max=disim(i,j);
            end
        end
    end
end
disim=disim(2:row+1,2:col+1);
for i=1:row
    for j=1:col
        if disim(i,j)==max
            cx=cx+i;
            cy=cy+j;
            count=count+1;
        end
    end
end
cx=cx/count;
cy=cy/count;
disout=disim;
for i=1:row
    for j=1:col
        disout(i,j)=round(255-double(disim(i,j))*255/87);
    end
end
disout=uint8(disout);
imshow(disout)
title('Image after distance transform');


