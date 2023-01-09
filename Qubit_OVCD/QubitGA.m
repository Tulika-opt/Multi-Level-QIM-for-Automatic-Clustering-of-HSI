function [clust_center,img2,maxf,clust_no,gtime,s_image,m]=QubitGA()
%n-Number of chromosomes
%Mu-Mutation probability
%Cr-Crossover probability
tic ;
n=20;
L=14;
t = 0;
ntrials = 0 ;
o=1;
r=1.9;
[img2,ctt,h]=insert();
[M1,M2]=Generate(L,n);
pr=QObservation(M1,M2,L,n);
sa=M1;
sb=M2;
sa1=M1;
sb1=M2;
maxf=0;
po=1;

cr=0.9;
mu=0.1;

fitp=0;
qt=0;
m=zeros(100,1);
[M1,M2]= rotation(M1,M2,pr,n,L);
iter=100;
for gen=1:iter
    if qt==1
        [M1,M2,fit]=Qdias(M1,M2,n,L,fit);
        sa=M1;
        sb=M2;
        
    end
    m(gen)=maxf;
    c=actclus(n,pr);
    [m,clust1,fit,pos,im,part_im]=Fitness(c,n,L,h,ctt,sa,sb,pr,img2);
    
    if(gen==1)
        po=pos;
        maxf=max(fit);
          gtime=toc;
        clust_center=im;
        s_image=part_im;
        clust_no=clust1;
          prevfit=fit;
    else
     for t=1:n
            if fit(t)>prevfit(t)
                qt=1;
            else qt=0;
            end
     end
        maxf=max(fit);
            clust_no=clust1;
            gconv=i;
            gtime=toc;
            clust_center=im;
            s_image=part_im;  
    end
    
    
    o=o+1;
    % p=s(po,:);
    [Sa,Sb,Pr,fit1]=selection(sa,sb,pr,n,fit);
    fit=fit1;
    [Ca,Cb,Cp]=cross(Sa,Sb,Pr,cr,L,n);
    [MU1,MU2]=mute(Ca,Cb,Cp,mu,L,n);

    
   
    
    for ti=1:n
        if(fit(ti)>prevfit(ti))
            MU1(ti,:)=sa1(ti,:);
            MU2(ti,:)=sb1(ti,:);
           
        end
    end
    sa=MU1;
    sb=MU2;
    sa1=MU1;
    sb1=MU2;
   
    prevfit=fit;
end


end