function segiempat= buatpersegi( b )
si=size(b);
if(si(1)>si(2))
    bn=si(1)-si(2);
    bn2=(bn/2);
    bn2=ceil(bn2);
    bn3=bn-bn2;
    baru=[];
    for i=1:si(1)
        for j=1:bn2
            baru(i,j)=1;
        end
        for j=1:si(2)
            baru(i,(bn2+j))=b(i,j);
        end
        for j=1:bn3
            baru(i,(bn2+si(2)+j))=1;
        end
    end
elseif(si(2)>si(1))
    bn=si(2)-si(1);
    bn2=(bn/2);
    bn2=ceil(bn2);
    bn3=bn-bn2;
    baru=[];
    for i=1:bn2
        for j=1:si(2)
            baru(i,j)=1;
        end
    end
    for i=1:si(1)
        for j=1:si(2)
            baru((i+bn2),j)=b(i,j);
        end
    end
    for i=1:bn3
        for j=1:si(2)
            baru((i+bn2+si(1)),j)=1;
        end
    end
else
    baru=b;
end

segiempat=baru;
end