function bagidata(lP)
load data/data;
load data/kelas;

appbnt1=size(data);
appbnt2=size(kelas);

appjmldataL=round((lP/100)*appbnt1(1));
appjmldataU=appbnt1(1)-appjmldataL;

dataLbaru=[];
dataUbaru=[];
namaL=[];
namaU=[];
kelasLbaru=[];
kelasUbaru=[];

nodat=1;
nodat1=1;

for i=min(kelas):max(kelas)
    bntK1=find(kelas==i)
    appjmldataL1=round((lP/100)*size(bntK1,1));
    appjmldataU1=size(bntK1,1)-appjmldataL1;
    for(i=1:appjmldataL1)
    for(j=1:appbnt1(2))
        dataLbaru(nodat,j)=data(bntK1(i),j);
    end
    kelasLbaru(nodat,1)=kelas(bntK1(i),1);
   
    nodat=nodat+1;
    end
    for(i=(appjmldataL1+1):size(bntK1,1))
        for(j=1:appbnt1(2))
            dataUbaru(nodat1,j)=data(bntK1(i),j);
            
        end
        kelasUbaru(nodat1,1)=kelas(bntK1(i),1);
            nodat1=nodat1+1;
    end
end

data_latih=dataLbaru;
target_latih =kelasLbaru;
data_uji=dataUbaru;
target_uji=kelasUbaru;
save data/data_latih.mat data_latih
save data/target_latih.mat target_latih
save data/data_uji.mat data_uji
save data/target_uji.mat target_uji

end