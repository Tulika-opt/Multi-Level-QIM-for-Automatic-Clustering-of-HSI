
function [clust_center,img2,maxf,clust_no,gtime,s_image,conv]=MEPSO()
tic;

%no of generations
clust_center=0;
img2=0;
maxf=0;

gconv=0;
time_s=0;
conv=0;
%no of clusters
iter=100;
time1=0;
flag=1;
time2=0;
flag=0;
W =0.9;   %inertial factor
maxf=0;
n=20;
g1=0;
L=20;
%intialise population
[img2,ctt,h]=insert();
[M1]=Generate(n,L);

phi1=zeros(iter,1);
%next velocity of particles
V_t=zeros(n,L);
gconv_pso=0;
gtime=0;
ex_no=5;
gBest_a=0;
na=0;
temp=1;
clust_no=0;
pbest_fit=zeros(n,L);
gbest_fit=0;
pBest=zeros(n,L);
gBest=zeros(1,L);
pexmp=zeros(ex_no,L);
for gen=1:iter
    c=actclus(n,M1);
    [m,clust1,fit,pos,im,part_im]=Fitness(c,n,L,h,ctt,M1,img2);
    sig=m;
    if gen==1
        maxf=min(fit);
        gtime=toc;
        clust_center=im;
        s_image=part_im;
        pbest_fit=fit;
        gbest_fit=sig;
        pBest=M1;
        gBest=M1(pos,:);
    else
        if min(fit)<maxf
            flag=flag+1;
            if flag>2 && ex_no>2
                ex_no=ex_no-1;
                flag=0;
            end
            maxf=min(fit);
            clust_no=clust1;
            gconv=i;
            gtime=toc;
            clust_center=im;
            s_image=part_im;
            [pBest,gBest,pbest_fit,gbest_fit,pexmp]=find_best_pso(fit,pbest_fit,gbest_fit,pBest,gBest,n,M1,pos);
        end
    end
    conv(gen)=maxf;
    
    [V_t1]=Generate_v_pso(pBest,gBest,pexmp,W,M1,n,L,gen,V_t,ex_no);
    V_t=V_t1;
    [new_pop,V_t1]=Update_pso(n,L,V_t,M1,pbest_fit,W);
    V_t=V_t1;
    M1=new_pop;
    b=new_pop;
    
end


end
