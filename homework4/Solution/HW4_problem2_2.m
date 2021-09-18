clear;clc;
im=imread('Image.bmp');
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
subplot(3,2,1);
imshow(im);
title('Original Image');


upoutput1=double(output1);
for j=col1:-1:1
    upoutput1=[upoutput1(:,1:j-1) zeros(row1,1) upoutput1(:,j:end)];
end

for i=row1:-1:1
    upoutput1=[upoutput1(1:i-1,:); zeros(1,2*col1); upoutput1(i:end,:)];
end
upoutput1=[zeros(2,2*col1);upoutput1;zeros(2,2*col1)];
upoutput1=[zeros(2*row1+4,2) upoutput1 zeros(2*row1+4,2)];
upoutputmid1=zeros(2*row1+4,2*col1);
lapout1=zeros(2*row1,2*col1);
for i=1:2*row1+4
    for j=1:2*col1
        upoutputmid1(i,j)=round(upoutput1(i,j)/8+upoutput1(i,j+1)/2+6*upoutput1(i,j+2)/8+upoutput1(i,j+3)/2+upoutput1(i,j+4)/8);
    end
end
for i=1:2*col1
    for j=1:2*row1
        lapout1(j,i)=round(upoutputmid1(j,i)/8+upoutputmid1(j+1,i)/2+6*upoutputmid1(j+2,i)/8+upoutputmid1(j+3,i)/2+upoutputmid1(j+4,i)/8);
    end
end
laplace1=uint8(double(im)-lapout1(1:row,1:col));
subplot(3,2,3);
imshow(laplace1);  
title('Level 1');


upoutput2=double(output2);
for j=col2:-1:1
    upoutput2=[upoutput2(:,1:j-1) zeros(row2,1) upoutput2(:,j:end)];
end

for i=row2:-1:1
    upoutput2=[upoutput2(1:i-1,:); zeros(1,2*col2); upoutput2(i:end,:)];
end
upoutput2=[zeros(2,2*col2);upoutput2;zeros(2,2*col2)];
upoutput2=[zeros(2*row2+4,2) upoutput2 zeros(2*row2+4,2)];
upoutputmid2=zeros(2*row2+4,2*col2);
lapout2=zeros(2*row2,2*col2);
for i=1:2*row2+4
    for j=1:2*col2
        upoutputmid2(i,j)=round(upoutput2(i,j)/8+upoutput2(i,j+1)/2+6*upoutput2(i,j+2)/8+upoutput2(i,j+3)/2+upoutput2(i,j+4)/8);
    end
end
for i=1:2*col2
    for j=1:2*row2
        lapout2(j,i)=round(upoutputmid2(j,i)/8+upoutputmid2(j+1,i)/2+6*upoutputmid2(j+2,i)/8+upoutputmid2(j+3,i)/2+upoutputmid2(j+4,i)/8);
    end
end
laplace2=uint8(double(output1)-lapout2(1:row1,1:col1));
subplot(3,2,4);
imshow(laplace2);  
title('Level 2');



upoutput3=double(output3);
for j=col3:-1:1
    upoutput3=[upoutput3(:,1:j-1) zeros(row3,1) upoutput3(:,j:end)];
end

for i=row3:-1:1
    upoutput3=[upoutput3(1:i-1,:); zeros(1,2*col3); upoutput3(i:end,:)];
end
upoutput3=[zeros(2,2*col3);upoutput3;zeros(2,2*col3)];
upoutput3=[zeros(2*row3+4,2) upoutput3 zeros(2*row3+4,2)];
upoutputmid3=zeros(2*row3+4,2*col3);
lapout3=zeros(2*row3,2*col3);
for i=1:2*row3+4
    for j=1:2*col3
        upoutputmid3(i,j)=round(upoutput3(i,j)/8+upoutput3(i,j+1)/2+6*upoutput3(i,j+2)/8+upoutput3(i,j+3)/2+upoutput3(i,j+4)/8);
    end
end
for i=1:2*col3
    for j=1:2*row3
        lapout3(j,i)=round(upoutputmid3(j,i)/8+upoutputmid3(j+1,i)/2+6*upoutputmid3(j+2,i)/8+upoutputmid3(j+3,i)/2+upoutputmid3(j+4,i)/8);
    end
end
laplace3=uint8(double(output2)-lapout3(1:row2,1:col2));
subplot(3,2,5);
imshow(laplace3);  
title('Level 3');



[row4, col4]=size(output4);
upoutput4=double(output4);
for j=col4:-1:1
    upoutput4=[upoutput4(:,1:j-1) zeros(row4,1) upoutput4(:,j:end)];
end

for i=row4:-1:1
    upoutput4=[upoutput4(1:i-1,:); zeros(1,2*col4); upoutput4(i:end,:)];
end
upoutput4=[zeros(2,2*col4);upoutput4;zeros(2,2*col4)];
upoutput4=[zeros(2*row4+4,2) upoutput4 zeros(2*row4+4,2)];
upoutputmid4=zeros(2*row4+4,2*col4);
lapout4=zeros(2*row4,2*col4);
for i=1:2*row4+4
    for j=1:2*col4
        upoutputmid4(i,j)=round(upoutput4(i,j)/8+upoutput4(i,j+1)/2+6*upoutput4(i,j+2)/8+upoutput4(i,j+3)/2+upoutput4(i,j+4)/8);
    end
end
for i=1:2*col4
    for j=1:2*row4
        lapout4(j,i)=round(upoutputmid4(j,i)/8+upoutputmid4(j+1,i)/2+6*upoutputmid4(j+2,i)/8+upoutputmid4(j+3,i)/2+upoutputmid4(j+4,i)/8);
    end
end
laplace4=uint8(double(output3)-lapout4(1:row3,1:col3));
subplot(3,2,6);
imshow(laplace4);  
title('Level 4');