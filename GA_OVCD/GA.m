function [clust_center,img2,maxf,clust_no,gtime,s_image,m]=GA(temp1)
%n-Number of chromosomes
%Mu-Mutation probability
%Cr-Crossover probability
tic ;
r=1+rand();
n=20;
t = 0;
ntrials = 0 ;
o=1;
L=20;
[img2,ctt,h]=insert();
M1=Generate(n,L);
s=M1;
maxf=0;
po=1;
cr=0.9;
mu=0.1;
% gconv=0;
% gtime=0;
 m=zeros(1000,1);
 for gen=1:100
 c=actclus(n,M1);
 [m,clust1,fit,pos,im,part_im]=Fitness(c,n,L,h,ctt,s,img2);
 sig=m;
    if gen==1
        po=pos;
        maxf=max(fit);
        gtime=toc;
        clust_center=im;
        s_image=part_im;
       
    else
        if max(fit)>maxf
            maxf=min(fit);
            po=pos;
            clust_no=clust1;
            gconv=i;
            gtime=toc;
            clust_center=im;
            s_image=part_im;
            
        end
    end 
p=s(po,:);
S=selection(s,n,fit,L);
C=cross(S,cr,L,n);
MU=mute(C,mu,L,n,p);
s=MU;
m(gen)=maxf;
end
total=toc;


end