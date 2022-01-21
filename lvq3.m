function [waktu Wlvq WlvqC ep ] = lvq3( data,kelas,lr,plr,mlr,win, epoh,m)

    tic;
    bnt99=size(data);
    bnt100=bnt99(1);
    Wlvq=[];
    Xlvq=[];
    WlvqC=[];
    XlvqC=[];
    sampel=[];
    %mulai proses LVQ
    %pisahkan W dan X

    ep=0;
    for i=1:bnt100
        hlpsyb=0;
        for nn=1:length(WlvqC)
            if(kelas(i)==WlvqC(nn))
                hlpsyb=hlpsyb+1;
            end
        end
        
        if(hlpsyb<5)
            wbnt=size(data);
            wbnt2=[];
            for ww=1:wbnt(2)
                wbnt2=[wbnt2 data(i,ww)];
            end
            Wlvq=[Wlvq; wbnt2];
            WlvqC=[WlvqC; kelas(i)];
            sampel=[sampel; i];
        else
            wbnt=size(data);
            wbnt2=[];
            for ww=1:wbnt(2)
                wbnt2=[wbnt2 data(i,ww)];
            end       
            Xlvq=[Xlvq; wbnt2];
            XlvqC=[XlvqC; kelas(i)];
        end
    
    end
    clear bnt100 bnt99 hlpyb i nn sampel bnt bnt2 ww hlpsyb wbnt bnt2
    %ditemukan Wlvq sebagai nilai W dan Xlvq sebagai nilai X


    bntuj=size(Xlvq);
    bntlat=size(Wlvq);
    %mulai hitung LVQ3 
    
    for iin=1:epoh %pengulangan selama epoch
        beta=m*lr;
        ep=ep+1;
        for aa=1:bntuj(1)
            kecilL=10000000000000000; %nilai terkecil untuk DC1
            kecilL2=10000000000000000; %nilai terkecil untuk DC2
            plhKecil=0; %X untuk DC1
            plhKecil2=0; %X untuk DC2 
            t1=0;
            t2=0;
            target2=0;  % Target DC1 (T atau F)
            target22=0; % Target DC2 (T atau F)
            DC=[0 0];
            for bb=1:bntlat(1)
                jrjbnt=size(Xlvq);
                jarakL1=0;
                for jrj=1:jrjbnt(2)
                    jarakL1=jarakL1+(((Xlvq(aa,jrj)-Wlvq(bb,jrj))*(Xlvq(aa,jrj)-Wlvq(bb,jrj))));%cari jarak antara data X dan data W
                end
                jarakL2(bb)=sqrt(jarakL1);
                
                %cari jarak terpendek DC1
                if(jarakL2(bb)<kecilL)
                    kecilL=jarakL2(bb);
                    plhKecil2=plhKecil;
                    plhKecil=bb;
                    DC(1)=jarakL2(bb);
                    target22=target2;
                    t1=WlvqC(bb);
                    if(WlvqC(bb)==XlvqC(aa))
                        
                        target2=1;% cek class X dan class W sama
                    else
                        target2=0;% cek class X dan class W beda
                    end
                else
                    %cari jarak terpendek DC2
                    if(jarakL2(bb)<kecilL2)
                        kecilL2=jarakL2(bb);
                        plhKecil2=bb;
                        DC(2)=jarakL2(bb);
                        t2=WlvqC(bb);
                        if(WlvqC(bb)==XlvqC(aa))
                            target22=1;% cek class X dan class W sama
                        else
                            target22=0;% cek class X dan class W beda
                        end
                    end
                
                end
            end
            
            if(target2 == 1)
                jrjbnt=size(Xlvq);
                for jrj=1:jrjbnt(2)% hitung nilai W baru
                        Wlvq(plhKecil,jrj)=Wlvq(plhKecil, jrj)+(lr*(Xlvq(aa,jrj)-Wlvq(plhKecil, jrj)));
                       
                end
            else
            if(target22 == 0)
                Wlvq(plhKecil,jrj)=Wlvq(plhKecil, jrj)-(lr*(Xlvq(aa,jrj)-Wlvq(plhKecil, jrj)));
            else
            
            bntS1=[DC(1)/DC(2),DC(2)/DC(1)];
            bntS1=min(bntS1);
            bntS2=(1-win)/(1+win);
            jrjbnt=size(Xlvq);
            if(bntS1>bntS2)
               for jrj=1:jrjbnt(2)% hitung nilai W baru
                    Wlvq(plhKecil,jrj)=Wlvq(plhKecil, jrj)-(lr*(Xlvq(aa,jrj)-Wlvq(plhKecil, jrj)));
                    Wlvq(plhKecil2,jrj)=Wlvq(plhKecil2, jrj)+(lr*(Xlvq(aa,jrj)-Wlvq(plhKecil2, jrj)));
               end
                   
            else
                 for jrj=1:jrjbnt(2)% hitung nilai W baru
                        Wlvq(plhKecil,jrj)=Wlvq(plhKecil, jrj)-(beta*lr*(Xlvq(aa,jrj)-Wlvq(plhKecil, jrj)));
                        Wlvq(plhKecil2,jrj)=Wlvq(plhKecil2, jrj)+(beta*lr*(Xlvq(aa,jrj)-Wlvq(plhKecil2, jrj)));
                    end
              
                   
                
            end
            end
            end
        end
        lr=lr-(0.1*lr);
        if(lr<=mlr) % jika sudah sampai minimum learningrate berhenti pengulangan
            break;
        end
        iin
    end
    waktu=toc;
end

