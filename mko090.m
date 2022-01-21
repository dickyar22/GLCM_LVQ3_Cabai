%mko090.m - MATRIKS KOOKURENSI 90 DERAJAT
function MatriksHasil=mko090(imageName)
imageName=double(imageName);
Temp=zeros(256);
[tinggi,lebar]=size(imageName);
for i=2:tinggi
	for j=1:lebar
		p=imageName(i,j)+1;
		q=imageName(i-1,j)+1;
		Temp(p,q) = Temp(p,q)+1 ;
		Temp(q,p) = Temp(q,p)+1 ;
	end
end
JumlahPixel=sum(sum(Temp));
MatriksHasil=Temp/JumlahPixel;
