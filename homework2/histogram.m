function y=histogram(I)
[row col]=size(I);
h=zeros(1,256);
for i=1:row
    for j=1:col
        h(I(i,j)+1)=h(I(i,j)+1)+1;
    end
end
y=h;
end