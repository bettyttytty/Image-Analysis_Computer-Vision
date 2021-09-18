% % % clear;
% % im=imread('Image.bmp');
% % img=im(:,:,1); 
% % [row,col]=size(img);
% % % img=imrotate(img,45);
% % % dd = [-1 0 1];  
% % % Ix=filter2(dd,img);
% % % Ixx = filter2(dd,img).^2;  
% % % Ix3=conv2(dd,img).^2; 
% % % Iyy = filter2(dd',img).^2;  
% % % Iy3=conv2(img,dd').^2; 
% % % Ixy = filter2(dd,img).*filter2(dd',img);
% % 
% % 
% % dd=[-1 0 1];
% % dx=zeros(row,col);
% % dy=dx;
% % % img=im(:,:,1);
% % img=[zeros(1,col);img;zeros(1,col)];
% % img=[zeros(row+2,1) img zeros(row+2,1)];
% % % dx=conv2(dd,img); 
% % % dx=dx(:,2:col+1);
% % % dy=conv2(img,dd'); 
% % % dy=dy(2:row+1,:);
% % for i=1:row
% %     for j=1:col
% %         dx(i,j)=img(i,j+2)-img(i,j);%2*img(i,j+4)+-2*img(i,j);
% %     end
% % end
% % 
% % for j=1:col
% %     for i=1:row
% %         dy(i,j)=img(i+2,j)-img(i,j);%2*img(i+4,j)+-2*img(i,j);
% %     end
% % end
% % 
% % Ixx=dx.*dx;
% % Iyy=dy.*dy;
% % Ixy=dx.*dy;
% % 
% % img=img(2:row+1,2:col+1);
% % 
% % 
% % %生成 5*5高斯窗口。窗口越大，探测到的角点越少。
% % % h= fspecial('gaussian',5,2);
% % 
% % G = [exp(-8), exp(-5), exp(-4), exp(-5), exp(-8)
% %     exp(-5), exp(-2), exp(-1), exp(-2), exp(-5)
% %     exp(-4), exp(-1), 1, exp(-1), exp(-4)
% %     exp(-5), exp(-2), exp(-1), exp(-2), exp(-5)
% %     exp(-8), exp(-5), exp(-4), exp(-5), exp(-8)];
% % G= 1/(sum(sum(G))).* G;
% % 
% % A=conv2(Ixx,G,'same');
% % B=conv2(Ixy,G,'same');
% % C=conv2(Iyy,G,'same');
% % 
% % % A = filter2(G,Ixx);       % 用高斯窗口差分Ixx得到A 
% % % B = filter2(G,Iyy);                                 
% % % C = filter2(G,Ixy);                                                              
% % Corner = zeros(row,col); %zeros用来产生一个全零矩阵，故矩阵Corner用来保存候选角点位置,初值全零，值为1的点是角点
% %  
% %  %define t, when the diffierence between the pixel value of the center
% %  %point and the neighbouring point is lower than (-t,t), we define these
% %  %two point are similar.
% %  t=20;
% % 
% %  %I delete the pixel on the boundary. Iterate from 8th row and 8th column.
% %  boundary=4;
% %  for i=boundary:row-boundary+1 
% %     for j=boundary:col-boundary+1
% %          nlike=0; %相似点个数
% %          if img(i-1,j-1)>img(i,j)-t && img(i-1,j-1)<img(i,j)+t 
% %             nlike=nlike+1;
% %          end
% %          if img(i-1,j)>img(i,j)-t && img(i-1,j)<img(i,j)+t  
% %             nlike=nlike+1;
% %          end
% %          if img(i-1,j+1)>img(i,j)-t && img(i-1,j+1)<img(i,j)+t  
% %             nlike=nlike+1;
% %          end  
% %         if img(i,j-1)>img(i,j)-t && img(i,j-1)<img(i,j)+t  
% %             nlike=nlike+1;
% %          end
% %          if img(i,j+1)>img(i,j)-t && img(i,j+1)<img(i,j)+t  
% %             nlike=nlike+1;
% %          end
% %          if img(i+1,j-1)>img(i,j)-t && img(i+1,j-1)<img(i,j)+t  
% %             nlike=nlike+1;
% %          end
% %          if img(i+1,j)>img(i,j)-t && img(i+1,j)<img(i,j)+t  
% %             nlike=nlike+1;
% %          end
% %          if img(i+1,j+1)>img(i,j)-t && img(i+1,j+1)<img(i,j)+t  
% %             nlike=nlike+1;
% %          end
% %          if nlike>=2 && nlike<=6
% %              Corner(i,j)=1;
% %          end
% %     end
% %  end
% % R = zeros(row,col);
% % Rmax = 0; 
% % k=0.06;   
% % %
% % %R(i,j) =det(M)/trace(M)
% % 
% %  for i = boundary:row-boundary+1
% %      for j = boundary:col-boundary+1
% %      if Corner(i,j)==1  %只关注候选点
% %          M = [A(i,j) C(i,j);
% %               C(i,j) B(i,j)];      
% %          R(i,j) = det(M)-k*(trace(M))^2;
% %          if R(i,j) > Rmax 
% %             Rmax = R(i,j);    
% %          end
% %      end
% %      end 
% %  end
% %  
% %  
% % Num=50;
% % temp=sort(R(:),'descend');
% % temp=temp(Num);
% % 
% % % figure(4)
% % % imshow(img)
% % % for i=1:row
% % %     for j=1:col
% % %         if R(i,j)>=temp
% % %             hold on
% % %             plot(j,i,'ro')
% % %         end
% % %     end
% % % end
% % % title('Selected features based on the value of local maximums')
% % 
% %  
% %  
% %  
% %  
% % %Rmax
% %  count = 0;       % 用来记录角点的个数
% %  t=0.01;        
% % % 下面通过一个3*3的窗口来判断当前位置是否为角点
% %  for i = boundary:row-boundary+1 
% % for j = boundary:col-boundary+1
% %          if Corner(i,j)==1  %只关注候选点的八邻域
% %              if R(i,j) > t*Rmax && R(i,j) >R(i-1,j-1) ......%?????为什么要R(i,j) > t*Rmax啊？求大神告知
% %                 && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) ......
% %                 && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) ......
% %                 && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j)......
% %                 && R(i,j) > R(i+1,j+1) 
% %             count=count+1;%这个是角点，count加1
% %              else % 如果当前位置（i,j）不是角点，则在Corner(i,j)中删除对该候选角点的记录
% %                  Corner(i,j) = 0;     
% %              end
% %          end
% % end 
% %  end 
% % % disp('角点个数');
% %  % disp(count)
% %  figure,imshow(img);      % display Intensity img
% %  hold on; 
% % % toc(t1)
% %  for i=boundary:row-boundary+1 
% % for j=boundary:col-boundary+1
% %          column_ave=0;
% %          row_ave=0;
% %          k=0;
% %         if Corner(i,j)==1
% %              for x=i-3:i+3  %7*7邻域
% %                  for y=j-3:j+3
% %                      if Corner(x,y)==1
% %  % 用算数平均数作为角点坐标，如果改用几何平均数求点的平均坐标，对角点的提取意义不大
% %                          row_ave=row_ave+x;
% %                          column_ave=column_ave+y;
% %                          k=k+1;
% %                      end
% %                  end
% %              end
% %          end
% %          if k>0 %周围不止一个角点           
% %              plot( column_ave/k,row_ave/k ,'ro')
% %          end
% % end 
% % end 
% % title('After Non-Local Maximum Suppression');
%%%Prewitt Operator Corner Detection.m
%%%时间优化--相邻像素用取差的方法求Harris角点
 %% 
 clear;
 Image = imread('Image.bmp');                 % 读取图像
 Image=imrotate(Image,45); 
  
 
dx = [-1 0 1;-1 0 1;-1 0 1];  %dx：横向Prewitt差分模版
Ix2 = filter2(dx,Image).^2;   
Iy2 = filter2(dx',Image).^2;                                        
Ixy = filter2(dx,Image).*filter2(dx',Image);
 
%生成 9*9高斯窗口。窗口越大，探测到的角点越少。
h= fspecial('gaussian',9,2);
A = filter2(h,Ix2);       % 用高斯窗口差分Ix2得到A 
B = filter2(h,Iy2);                                 
C = filter2(h,Ixy);                                  
nrow = size(Image,1);                            
ncol = size(Image,2);                             
Corner = zeros(nrow,ncol); %zeros用来产生一个全零矩阵，故矩阵Corner用来保存候选角点位置,初值全零，值为1的点是角点
 
 %参数t:点(i,j)八邻域的“相似度”参数，只有中心点与邻域其他八个点的像素值之差在
 %（-t,+t）之间，才确认它们为相似点，相似点不在候选角点之列
 t=20;
 
 %我并没有全部检测图像每个点，而是除去了边界上boundary个像素，也就是从第8行第8列开始遍历。
 %因为我们感兴趣的角点并不出现在边界上
 %个人觉得这一部分是的主要目的是找出可能是角点的点，缩小范围，加快运算速度。
 %具体思想是如果中心点（i,j）周围8个点中有7、8个点灰度值与之相似，那么该中心点应该处于平坦区域，不可能为角点，
 %如果中心点（i,j）周围只有1个点或者没有点与之相似，那么该中心点也不可能为角点。
 boundary=8;
 for i=boundary:nrow-boundary+1 
    for j=boundary:ncol-boundary+1
         nlike=0; %相似点个数
         if Image(i-1,j-1)>Image(i,j)-t && Image(i-1,j-1)<Image(i,j)+t 
            nlike=nlike+1;
         end
         if Image(i-1,j)>Image(i,j)-t && Image(i-1,j)<Image(i,j)+t  
            nlike=nlike+1;
         end
         if Image(i-1,j+1)>Image(i,j)-t && Image(i-1,j+1)<Image(i,j)+t  
            nlike=nlike+1;
         end  
        if Image(i,j-1)>Image(i,j)-t && Image(i,j-1)<Image(i,j)+t  
            nlike=nlike+1;
         end
         if Image(i,j+1)>Image(i,j)-t && Image(i,j+1)<Image(i,j)+t  
            nlike=nlike+1;
         end
         if Image(i+1,j-1)>Image(i,j)-t && Image(i+1,j-1)<Image(i,j)+t  
            nlike=nlike+1;
         end
         if Image(i+1,j)>Image(i,j)-t && Image(i+1,j)<Image(i,j)+t  
            nlike=nlike+1;
         end
         if Image(i+1,j+1)>Image(i,j)-t && Image(i+1,j+1)<Image(i,j)+t  
            nlike=nlike+1;
         end
         if nlike>=2 && nlike<=6
             Corner(i,j)=1;%如果周围有2~6个相似点，那(i,j)就是角点
         end;
     end;
 end;
CRF = zeros(nrow,ncol);    % CRF用来保存角点响应函数值,初值全零
 CRFmax = 0;                % 图像中角点响应函数的最大值，作阈值之用 
k=0.05;   
% 计算CRF
 %工程上常用CRF(i,j) =det(M)/trace(M)计算CRF，那么此时应该将下面第105行的
 %比例系数k设置大一些，k=0.1对采集的这几幅图像来说是一个比较合理的经验值
 for i = boundary:nrow-boundary+1
     for j = boundary:ncol-boundary+1
     if Corner(i,j)==1  %只关注候选点
         M = [A(i,j) C(i,j);
              C(i,j) B(i,j)];      
         CRF(i,j) = det(M)-k*(trace(M))^2;
         if CRF(i,j) > CRFmax 
            CRFmax = CRF(i,j);    
        end;            
    end
 end;             
end;  
%CRFmax
 count = 0;       % 用来记录角点的个数
 t=0.01;        
% 下面通过一个3*3的窗口来判断当前位置是否为角点
 for i = boundary:nrow-boundary+1 
for j = boundary:ncol-boundary+1
         if Corner(i,j)==1  %只关注候选点的八邻域
             if CRF(i,j) > t*CRFmax && CRF(i,j) >CRF(i-1,j-1) ......%?????为什么要CRF(i,j) > t*CRFmax啊？求大神告知
                && CRF(i,j) > CRF(i-1,j) && CRF(i,j) > CRF(i-1,j+1) ......
                && CRF(i,j) > CRF(i,j-1) && CRF(i,j) > CRF(i,j+1) ......
                && CRF(i,j) > CRF(i+1,j-1) && CRF(i,j) > CRF(i+1,j)......
                && CRF(i,j) > CRF(i+1,j+1) 
            count=count+1;%这个是角点，count加1
             else % 如果当前位置（i,j）不是角点，则在Corner(i,j)中删除对该候选角点的记录
                 Corner(i,j) = 0;     
            end;
         end; 
end; 
end; 
% disp('角点个数');
 % disp(count)
 figure,imshow(Image);      % display Intensity Image
 hold on; 
% toc(t1)
 for i=boundary:nrow-boundary+1 
for j=boundary:ncol-boundary+1
         column_ave=0;
         row_ave=0;
         k=0;
        if Corner(i,j)==1
             for x=i-3:i+3  %7*7邻域
                 for y=j-3:j+3
                     if Corner(x,y)==1
 % 用算数平均数作为角点坐标，如果改用几何平均数求点的平均坐标，对角点的提取意义不大
                         row_ave=row_ave+x;
                         column_ave=column_ave+y;
                         k=k+1;
                     end
                 end
             end
         end
         if k>0 %周围不止一个角点           
             plot( column_ave/k,row_ave/k ,'g.');
         end
 end; 
end; 
 
