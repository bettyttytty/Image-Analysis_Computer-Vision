function mask=rotatefeature(feature,deri_x,deri_y,patch)
[size_x,size_y]=size(feature);
x=zeros(1,8);
for i=1:size_x
    for j=1:size_y
        
        angle=atan(deri_y(i,j)/deri_x(i,j))/2/pi*360;
        mag=sqrt(deri_x(i,j)^2+deri_y(i,j)^2);
        if angle>=0&&angle<45
            x(1)=x(1)+mag;
            continue
        end
        if angle>=45&&angle<90
            x(2)=x(2)+mag;
            continue
        end
        if angle>=90&&angle<135
            x(3)=x(3)+mag;
            continue
        end
        if angle>=135&&angle<180
            x(4)=x(4)+mag;
            continue
        end
        if angle>=180&&angle<225
            x(5)=x(5)+mag;
            continue
        end
        if angle>=225&&angle<270
            x(6)=x(6)+mag;
            continue
        end
        if angle>=270&&angle<315
            x(7)=x(7)+mag;
            continue
        end
        if angle>=315&&angle<360
            x(8)=x(8)+mag;
            continue
        end
    end
end
[value,index]=max(x);
rotateangle=(index-1)*45;
mask=imrotate(feature,-rotateangle);
[mask_x,mask_y]=size(mask);
if mask_x==patch
    mask=mask((patch+1)/2:(patch*3-1)/2,(patch+1)/2:(patch*3-1)/2);
else
    mask=mask((patch+1)/2:(patch*3-1)/2,(patch+1)/2:(patch*3-1)/2);
end