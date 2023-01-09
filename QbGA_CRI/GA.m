function [maxf,img2,thresh,gconv,gtime,total,m,r]=QubitGA(temp1)
%n-Number of chromosomes
%Mu-Mutation probability
%Cr-Crossover probability
clear all;
tic ;
n=20;
t = 0;
ntrials = 0 ;
o=1;
K=14;
r=1.9;
[His,img2,L1]=insert();
[M1,M2]=Generate(L1,n);
pr=QObservation(M1,M2,L1,n);
sa=M1;
sb=M2;
maxf=0;
po=1;
thresh=zeros(1,K-1);
cr=0.9;
mu=0.1;
 [sa,sb]=Update(M1,M2,n,L1);
 fitp=0;
 qt=0;
 m=zeros(1000,1);
for i=1:1000
    if qt==1
   [M1,M2,fit]=Qdias(M1,M2,n,L1,fit);
   sa=M1;
sb=M2;

    end
    m(i)=maxf;
[th,sig,pos,fit]=Fitness(K,L1,sa,sb,His,pr,n,r);

if(i==1)
    po=pos;
    maxf=sig;
end

if(maxf<sig)
    for t=1:n
    if fit(t)<fitp(t)
        qt=1;
    else qt=0;
    end
    end
 maxf=sig;
    po=pos;
    thresh=th;
    gtime = toc;
    gconv=i;
     
 %   tElapsed = toc(t)

end
o=o+1;
% p=s(po,:);
[Sa,Sb,Pr,fit1]=selection(sa,sb,pr,n,fit);
fit=fit1;
[Ca,Cb,Cp]=cross(Sa,Sb,Pr,cr,L1,n);
[MU1,MU2]=mute(Ca,Cb,Cp,mu,L1,n);
sa=MU1;
sb=MU2;

fitp=fit;
% [M1,M2,M3,pr,fit1]=sort_fit(fit,sa,sb,sc,n,pr,L1);

% [M1,M2,M3,fit]=Qdias(M1,M2,M3,n,L1,fit);
% sa=M1;
% sb=M2;
% sc=M3;
 m(i)=maxf;
end
total=toc;
end