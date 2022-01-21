function xx=setingcrop(a1)
if(size(a1,3)<3)
            a1=cat(3,a1,a1,a1);
        end
        gray=rgb2gray(a1);
thresh=graythresh(gray); 
a=im2bw(gray,thresh);
si=size(a);
Y1=sum(a,2);
Y2=sum(a,1);
x=0;
y=0;
for i=1:si(1)
    if(Y1(i)~=si(2))
        x=(i-1);
        break
    end
        
end
for i=1:si(2)
    if(Y2(i)~=si(1))
        y=(i-1);
        break
    end
        
end



an=0;
bn=0;
ul=si(1);
for i=1:si(1)
    if(Y1(ul)~=si(2))
        an=si(1)-(x+(i-1));
        break
    end
        ul=ul-1;
end
ul=si(2);
for i=1:si(2)
    if(Y2(ul)~=si(1))
        bn=si(2)-(y+(i-1));
        break
    end
        ul=ul-1;
end
xx=imcrop(a1,[y-20 x-20 bn+40 an+40]);
z=imresize(xx, [NaN 850]);
bnt=size(z);
bnt2=(850-(bnt(1)))/2;
satu= (255 * ones(ceil(bnt2),850,3,'uint8'));
dua= (255 * ones((850-(bnt(1))-ceil(bnt2)),850,3,'uint8'));
hasil=cat(1,satu,z,dua);
hasil2=imresize(xx, [850 NaN]);
ceklagi= size(hasil2);

if(ceklagi(2)<850)
    bnt2=(850-(ceklagi(2)))/2;
    satu= (255 * ones(850,ceil(bnt2),3,'uint8'));
    dua= (255 * ones(850, (850-(ceklagi(2))-ceil(bnt2)),3,'uint8'));
    hasil=cat(2,satu,hasil2,dua);
end
xx=imresize(hasil, [300 300]);
end