clear;
clc;
%% original
subplot(2,3,1)
axis([0 10 0 10]);
ca=[0 1/2/sqrt(3) 1-1/2/sqrt(3) 1 1-1/2/sqrt(3) 1/2/sqrt(3);0.5 0 0 0.5 1 1];  %The coordinates of the points
[len,wid]=size(ca);
nor=ones(1,wid);
ha=[ca;nor];

for i=1:wid-1;
    line([ha(1,i),ha(1,i+1)],[ha(2,i),ha(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([ha(1,1),ha(1,wid)],[ha(2,1),ha(2,wid)]);  %line the first point and the last point
daspect([1 1 1])
title('original hexagon')
%% translation
subplot(2,3,2)
axis([0 10 0 10]);
ha=[0 1/2/sqrt(3) 1-1/2/sqrt(3) 1 1-1/2/sqrt(3) 1/2/sqrt(3);0.5 0 0 0.5 1 1]; %The coordinates of the points
[len,wid]=size(ha);
nor=ones(1,wid);
ha=[ha;nor];

for i=1:wid-1;
    line([ha(1,i),ha(1,i+1)],[ha(2,i),ha(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([ha(1,1),ha(1,wid)],[ha(2,1),ha(2,wid)]);  %line the first point and the last point
hold on
trans=zeros(len+1,wid);

tx=5;
ty=5;
translation=[1 0 tx;0 1 ty;0 0 1];
trans=translation*ha;

for i=1:wid-1;
    line([trans(1,i),trans(1,i+1)],[trans(2,i),trans(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([trans(1,1),trans(1,wid)],[trans(2,1),trans(2,wid)]);  %line the first point and the last point
daspect([1 1 1])
title('hexagon after translation')
ctrans=trans(1:len,1:wid);%Cartesian coordinates after translation
%% euclidean
subplot(2,3,3)
axis([0 10 0 10]);
ha=[0 1/2/sqrt(3) 1-1/2/sqrt(3) 1 1-1/2/sqrt(3) 1/2/sqrt(3);0.5 0 0 0.5 1 1];  %The coordinates of the points
[len,wid]=size(ha);
nor=ones(1,wid);
ha=[ha;nor];

for i=1:wid-1;
    line([ha(1,i),ha(1,i+1)],[ha(2,i),ha(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([ha(1,1),ha(1,wid)],[ha(2,1),ha(2,wid)]);  %line the first point and the last point
hold on

beta=30;
tx=5;
ty=5;
euclidean=[cosd(beta) -sind(beta) tx;sind(beta) cosd(beta) ty;0 0 1];
eu=euclidean*ha;

for i=1:wid-1;
    line([eu(1,i),eu(1,i+1)],[eu(2,i),eu(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([eu(1,1),eu(1,wid)],[eu(2,1),eu(2,wid)]);  %line the first point and the last point
daspect([1 1 1])
title('hexagon after euclidean')%translation (5,5) and rotation 30бу
ceu=eu(1:len,1:wid);%Cartesian coordinates after euclidean
%% similarity
subplot(2,3,4)
axis([0 10 0 10]);
ha=[0 1/2/sqrt(3) 1-1/2/sqrt(3) 1 1-1/2/sqrt(3) 1/2/sqrt(3);0.5 0 0 0.5 1 1];  %The coordinates of the points
[len,wid]=size(ha);
nor=ones(1,wid);
ha=[ha;nor];

for i=1:wid-1;
    line([ha(1,i),ha(1,i+1)],[ha(2,i),ha(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([ha(1,1),ha(1,wid)],[ha(2,1),ha(2,wid)]);  %line the first point and the last point
hold on

similarity=[1 -2 tx;2 1 ty;0 0 1];
sim=similarity*ha;

for i=1:wid-1;
    line([sim(1,i),sim(1,i+1)],[sim(2,i),sim(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([sim(1,1),sim(1,wid)],[sim(2,1),sim(2,wid)]);  %line the first point and the last point
daspect([1 1 1])
title('hexagon after similarity')
csim=sim(1:len,1:wid);%Cartesian coordinates after similarity
%% affine
subplot(2,3,5)
axis([0 10 0 10]);
ha=[0 1/2/sqrt(3) 1-1/2/sqrt(3) 1 1-1/2/sqrt(3) 1/2/sqrt(3);0.5 0 0 0.5 1 1];  %The coordinates of the points
[len,wid]=size(ha);
nor=ones(1,wid);
ha=[ha;nor];

for i=1:wid-1;
    line([ha(1,i),ha(1,i+1)],[ha(2,i),ha(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([ha(1,1),ha(1,wid)],[ha(2,1),ha(2,wid)]);  %line the first point and the last point
hold on

aff=zeros(len+1,wid);
affine=[1 2 2;2 1 3;0 0 1];
aff=affine*ha;

for i=1:wid-1;
    line([aff(1,i),aff(1,i+1)],[aff(2,i),aff(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([aff(1,1),aff(1,wid)],[aff(2,1),aff(2,wid)]);  %line the first point and the last point
daspect([1 1 1])
title('hexagon after affine')
caff=aff(1:len,1:wid);%Cartesian coordinates after affine
%% projective
subplot(2,3,6)
axis([0 10 0 10]);
ha=[0 1/2/sqrt(3) 1-1/2/sqrt(3) 1 1-1/2/sqrt(3) 1/2/sqrt(3);0.5 0 0 0.5 1 1];  %The coordinates of the points
[len,wid]=size(ha);
nor=ones(1,wid);
ha=[ha;nor];

for i=1:wid-1;
    line([ha(1,i),ha(1,i+1)],[ha(2,i),ha(2,i+1)]);  %line([x1,x2],[y1,y2])
    hold on
end
hold on
line([ha(1,1),ha(1,wid)],[ha(2,1),ha(2,wid)]);  %line the first point and the last point
hold on

pro=zeros(len+1,wid);
projective=[1 2 2;2 1 3;0.6 0.7 0.5];
pro=projective*ha;
pro=pro./pro(len+1,:);
for i=1:wid-1;
    %line([pro(1,i)/pro(len+1,i),pro(1,i+1)/pro(len+1,i+1)],[pro(2,i)/pro(len+1,i),pro(2,i+1)/pro(len+1,i+1)]);  %line([x1,x2],[y1,y2])
    line([pro(1,i),pro(1,i+1)],[pro(2,i),pro(2,i+1)]);
    hold on
end
hold on
%line([pro(1,1)/pro(len+1,1),pro(1,wid)/pro(len+1,wid)],[pro(2,1)/pro(len+1,1),pro(2,wid)/pro(len+1,wid)]);  %line the first point and the last point
line([pro(1,1),pro(1,wid)],[pro(2,1),pro(2,wid)]);
daspect([1 1 1])
title('hexagon after projective')
cpro=pro(1:len,1:wid);%Cartesian coordinates after projective