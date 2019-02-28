%clear;clc;
% % % %% Q1
% % % im=imread('Image.bmp');
% % % % im=imread('checkerboard.jpg');
% % % img=im(:,:,1);
% % % img=imrotate(img,45);
% % % figure(1)
% % % imshow(img)
% % % title('Original Image')
% % % [row,col]=size(img);
% % % %% Q2(a)
% % % %assume that the kernel is kernel [-2 -1 0 1 2], use zero-padding
% % % dd=[-2 -1 0 1 2];
% % % dx=convolute(dd,img);
% % % dy=convolute(dd',img);
% % % 
% % % % dx=uint8(dx);
% % % % dy=uint8(dy);
% % % % figure(2)
% % % % subplot(1,2,1);
% % % % imshow(dx);
% % % % title('x-Derivative');
% % % % subplot(1,2,2);
% % % % imshow(dy);
% % % % title('y-Derivative');
% % % 
% % % %% Q2(b)
% % % dx=double(dx);
% % % dy=double(dy);
% % % Ixx=dx.*dx;
% % % Iyy=dy.*dy;
% % % Ixy=dx.*dy;
% % % 
% % % %use 5*5 Gaussian filter to smoothen A
% % % G = [exp(-8), exp(-5), exp(-4), exp(-5), exp(-8)
% % %     exp(-5), exp(-2), exp(-1), exp(-2), exp(-5)
% % %     exp(-4), exp(-1), 1, exp(-1), exp(-4)
% % %     exp(-5), exp(-2), exp(-1), exp(-2), exp(-5)
% % %     exp(-8), exp(-5), exp(-4), exp(-5), exp(-8)];
% % % G = 1/(sum(sum(G))).* G;
% % % Ixx=convolute(G,Ixx);
% % % Ixy=convolute(G,Ixy);
% % % Iyy=convolute(G,Iyy);
% % % 
% % % k = 0.06;
% % % R = (Ixx.*Iyy-Ixy.*Ixy)-(k*(Ixx+Iyy).^2);
% % % % RR = abs(R);
% % % % RR=double(uint8(RR));
% % % % RR=(RR-min(RR(:)))./(max(RR(:))-min(RR(:))).*255;
% % % % RR=uint8(RR);
% % % % figure(3)
% % % % imshow(RR)
% % % % title('Usefulness of the features');
% % % 
% % % Num=500;
% % % % temp=sort(R(:),'descend');
% % % % temp=temp(Num);
% % % % 
% % % % figure(4)
% % % % 
% % % % imshow(img)
% % % % for i=1:row
% % % %     for j=1:col
% % % %         if R(i,j)>=temp
% % % %             hold on
% % % %             plot(j,i,'ro')
% % % %         end
% % % %     end
% % % % end
% % % % title('Selected features based on the value of local maximums')
% % % %% Q3
% % % % r=11; %radius of local maximum using adaptive non-maximal suppression
% % % % corner=zeros(row,col);
% % % % R=[zeros((r-1)/2,col);R;zeros((r-1)/2,col)];
% % % % R=[zeros(row+(r-1),(r-1)/2) R zeros(row+(r-1),(r-1)/2)];
% % % %  
% % % % t=zeros(r,r);
% % % % count=0;
% % % % for i=1:row
% % % %     for j=1:col
% % % %         t=R(i:i+r-1,j:j+r-1);
% % % %         tmax=sort(t(:),'descend');
% % % %         if(tmax(1)==R(i+(r-1)/2,j+(r-1)/2)&&tmax(1)~=tmax(2))
% % % %             corner(i,j)=1;
% % % %             count=count+1;   
% % % %         end
% % % %     end
% % % % end
% % % % 
% % % % R=R((r-1)/2+1:end-(r-1)/2,(r-1)/2+1:end-(r-1)/2);
% % % % s=R.*corner;
% % % % 
% % % % t=sort(s(:),'descend');
% % % % t=t(Num);
% % % % 
% % % % figure(5)
% % % % imshow(img)
% % % % for i=1:row
% % % %     for j=1:col
% % % %         if corner(i,j)==1
% % % %             if s(i,j)>=t
% % % %                  hold on
% % % %                  plot(j,i,'ro')
% % % %             else corner(i,j)=0;
% % % %             end
% % % %         end
% % % %     end
% % % % end
% % % % title("After Non-Local Maximum Suppression")

im=imread('checkerboard.jpg');
img=im(:,:,1);
imgr=imrotate(img,45);
[row,col]=size(img);
[rowr,colr]=size(imgr);

[corner_o,deri_x,deri_y,R]=detHarrisCorners(img,80);
[corner_r,deri_x_r,deri_y_r,R_r]=detHarrisCorners(imgr,80);

% kernel=[-2 -1 0 1 2];
% deri_x=convolute(kernel,img);
% deri_y=convolute(kernel',img);
% deri_x_r=convolute(kernel,img);
% deri_y_r=convolute(kernel',img);
% figure(6)
count=0;
patch=11;
threshold=1.5*10^11;

figure(6)
imshow(img)
for i=1+patch:rowr-patch+1
    for j=1+patch:colr-2*patch+1
        if corner_r(i,j)==1
            mask_r=rotatefeature(R_r(i-patch:i+patch-1,j-patch:j+patch-1),deri_x_r(i-patch:i+patch-1,j-patch:j+patch-1),deri_y_r(i-patch:i+patch-1,j-patch:j+patch-1),patch);
            dmin=10^20;
            for k=1+patch:row-patch+1
                for l=1+patch:col-patch+1
                    if corner_o(k,l)==1
                        mask=rotatefeature(R(k-patch:k+patch-1,l-patch:l+patch-1),deri_x(k-patch:k+patch-1,l-patch:l+patch-1),deri_y(k-patch:k+patch-1,l-patch:l+patch-1),patch);
                        d=sqrt(sum(sum((mask_r-mask).^2)));
%                         dmin=min(dmin,d);
                        if d<dmin
                            dmin=min(dmin,d);
%                             count=count+1;
                            px=l;
                            py=k;
%                             hold on
%                             plot(l,k,'ro')
                        end
                    end
                end
            end
            if dmin<threshold
                    px
                    py
                    count=count+1;
                    hold on
                    plot(px,py,'ro')
            end
        end
    end
end
title('Match the features')