%mko135.m - MATRIKS KOOKURENSI 135 DERAJAT
function MatriksHasil=mko135(imageName)
imageName=double(imageName);
Temp=zeros(256);
[tinggi,lebar]=size(imageName);
for i=2:tinggi
	for j=2:lebar
		p=imageName(i,j)+1;
		q=imageName(i-1,j-1)+1;
		Temp(p,q) = Temp(p,q)+1 ;
		Temp(q,p) = Temp(q,p)+1 ;
	end
end
JumlahPixel=sum(sum(Temp));
MatriksHasil=Temp/JumlahPixel;