%mko000.m - MATRIKS KOOKURENSI 0 DERAJAT
function MatriksHasil=mko000(imageName)
imageName=double(imageName);
Temp=zeros(256);
[tinggi,lebar]=size(imageName);
for i=1:tinggi
	for j=1:lebar-1
		p=imageName(i,j)+1;
		q=imageName(i,j+1)+1;
		Temp(p,q) = Temp(p,q)+1 ;
		Temp(q,p) = Temp(q,p)+1 ;
	end
end
JumlahPixel=sum(sum(Temp));
MatriksHasil=Temp/JumlahPixel;