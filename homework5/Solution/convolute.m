function resultimg = convolute(kernel,img)
[k_size_x,k_size_y]=size(kernel);
[img_x,img_y]=size(img);
img=double(img);
pad_x=(k_size_x-1)/2;
pad_y=(k_size_y-1)/2;
img=[zeros(pad_x,img_y);img;zeros(pad_x,img_y)];
img=[zeros(img_x+2*pad_x,pad_y) img zeros(img_x+2*pad_x,pad_y)];
resultimg=zeros(img_x,img_y);
for i=1:img_x
    for j=1:img_y
        for k=1:k_size_x
            for l=1:k_size_y
                resultimg(i,j)=resultimg(i,j)+kernel(k_size_x+1-k,k_size_y+1-l)*img(i+k-1,j+l-1);
            end
        end
        resultimg(i,j)=abs(resultimg(i,j));
    end
end
