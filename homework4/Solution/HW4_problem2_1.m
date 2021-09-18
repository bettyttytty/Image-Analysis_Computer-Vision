clear;clc;
im=imread('Image.bmp');

subplot(3,2,1);
imshow(im);
title('Original Image');


[row, col]=size(im);
im1=double(im);
output1=zeros(row,col);
outputmid1=zeros(row+4,col);

im1=[zeros(2,col);im1;zeros(2,col)];
im1=[zeros(row+4,2) im1 zeros(row+4,2)];
for i=3:row+2
    for j=1:col
        outputmid1(i,j)=round(im1(i,j)/16+im1(i,j+1)/4+6*im1(i,j+2)/16+im1(i,j+3)/4+im1(i,j+4)/16);
    end
end


for i=1:col
    for j=1:row
        output1(j,i)=round(outputmid1(j,i)/16+outputmid1(j+1,i)/4+6*outputmid1(j+2,i)/16+outputmid1(j+3,i)/4+outputmid1(j+4,i)/16);
    end
end
for j=col:-2:2
    output1(:,j)=[];
end
for i=row:-2:2
    output1(i,:)=[];
end
output1=uint8(output1);
subplot(3,2,3);
imshow(output1);
title('Level 1');

[row1, col1]=size(output1);
im2=double(output1);
output2=zeros(row1,col1);
outputmid2=zeros(row1+4,col1);

im2=[zeros(2,col1);im2;zeros(2,col1)];
im2=[zeros(row1+4,2) im2 zeros(row1+4,2)];
for i=3:row1+2
    for j=1:col1
        outputmid2(i,j)=round(im2(i,j)/16+im2(i,j+1)/4+6*im2(i,j+2)/16+im2(i,j+3)/4+im2(i,j+4)/16);
    end
end


for i=1:col1
    for j=1:row1
        output2(j,i)=round(outputmid2(j,i)/16+outputmid2(j+1,i)/4+6*outputmid2(j+2,i)/16+outputmid2(j+3,i)/4+outputmid2(j+4,i)/16);
    end
end
for j=col1:-2:2
    output2(:,j)=[];
end
for i=row1:-2:2
    output2(i,:)=[];
end
output2=uint8(output2);
subplot(3,2,4);
imshow(output2);
title('Level 2');

[row2, col2]=size(output2);
im3=double(output2);
output3=zeros(row2,col2);
outputmid3=zeros(row2+4,col2);

im3=[zeros(2,col2);im3;zeros(2,col2)];
im3=[zeros(row2+4,2) im3 zeros(row2+4,2)];
for i=3:row2+2
    for j=1:col2
        outputmid3(i,j)=round(im3(i,j)/16+im3(i,j+1)/4+6*im3(i,j+2)/16+im3(i,j+3)/4+im3(i,j+4)/16);
    end
end


for i=1:col2
    for j=1:row2
        output3(j,i)=round(outputmid3(j,i)/16+outputmid3(j+1,i)/4+6*outputmid3(j+2,i)/16+outputmid3(j+3,i)/4+outputmid3(j+4,i)/16);
    end
end
for j=col2:-2:2
    output3(:,j)=[];
end
for i=row2:-2:2
    output3(i,:)=[];
end
output3=uint8(output3);
subplot(3,2,5);
imshow(output3);  
title('Level 3');


[row3, col3]=size(output3);
im4=double(output3);
output4=zeros(row3,col3);
outputmid4=zeros(row3+4,col3);

im4=[zeros(2,col3);im4;zeros(2,col3)];
im4=[zeros(row3+4,2) im4 zeros(row3+4,2)];
for i=3:row3+2
    for j=1:col3
        outputmid4(i,j)=round(im4(i,j)/16+im4(i,j+1)/4+6*im4(i,j+2)/16+im4(i,j+3)/4+im4(i,j+4)/16);
    end
end


for i=1:col3
    for j=1:row3
        output4(j,i)=round(outputmid4(j,i)/16+outputmid4(j+1,i)/4+6*outputmid4(j+2,i)/16+outputmid4(j+3,i)/4+outputmid4(j+4,i)/16);
    end
end
for j=col3:-2:2
    output4(:,j)=[];
end
for i=row3:-2:2
    output4(i,:)=[];
end
output4=uint8(output4);
subplot(3,2,6);
imshow(output4);  
title('Level 4');

