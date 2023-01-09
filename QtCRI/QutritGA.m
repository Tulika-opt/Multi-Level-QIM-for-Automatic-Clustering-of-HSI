function [clust_center,img2,maxf,clust_no,gtime,s_image,m]=QutritGA()
%n-Number of chromosomes
%Mu-Mutation probability
%Cr-Crossover probability
tic ;
n=10;
L=20;
t = 0;
ntrials = 0 ;
o=1;
r=1.9;
[img2,ctt,h]=insert();
[M1,M2,M3]=Generate(L,n);
pr=QObservation(M1,M2,M3,L,n);
sa=M1;
sb=M2;
sc=M3;
sa1=M1;
sb1=M2;
sc1=M3;
maxf=0;
po=1;

cr=0.9;
mu=0.1;

fitp=0;
qt=0;
m=zeros(100,1);
[M1,M2,M3]= rotation(M1,M2,M3,pr,n,L);
iter=100;
for gen=1:iter
    if qt==1
        [M1,M2,M3,fit]=Qdias(M1,M2,M3,n,L,fit);
        sa=M1;
        sb=M2;
        sc=M3;
        
    end
    m(gen)=maxf;
    c=actclus(n,pr);
    [m,clust1,fit,pos,im,part_im]=Fitness(c,n,L,h,ctt,sa,sb,sc,pr,img2);
    
    if(gen==1)
        po=pos;
        maxf=min(fit);
          gtime=toc;
        clust_center=im;
        s_image=part_im;
        clust_no=clust1;
          prevfit=fit;
    else
     for t=1:n
            if fit(t)<prevfit(t)
                qt=1;
            else qt=0;
            end
     end
        maxf=min(fit);
            clust_no=clust1;
            gconv=i;
            gtime=toc;
            clust_center=im;
            s_image=part_im;  
    end
    
    
    o=o+1;
    % p=s(po,:);
    [Sa,Sb,Sc,Pr,fit1]=selection(sa,sb,sc,pr,n,fit);
    fit=fit1;
    [Ca,Cb,Cc,Cp]=cross(Sa,Sb,Sc,Pr,cr,L,n);
    [MU1,MU2,MU3]=mute(Ca,Cb,Cc,Cp,mu,L,n);


   
    
    for ti=1:n
        if(fit(ti)>prevfit(ti))
            MU1(ti,:)=sa1(ti,:);
            MU2(ti,:)=sb1(ti,:);
            MU3(ti,:)=sc1(ti,:);
           
        end
    end
    sa=MU1;
    sb=MU2;
    sc=MU3;
    sa1=MU1;
    sb1=MU2;
    sc1=MU3;
   
    prevfit=fit;
end


end