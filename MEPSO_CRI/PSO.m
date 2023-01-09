
function [Best_score_pso,fopt_pso,time_pso,gconv_pso]=EDWPSO(n,tgen,lb,ub,L1,fobj)
tic;

%no of generations

%no of clusters
time1=0;
time2=0;
C1=0.8;
C2=0.8;
W = 1.2;   %inertial factor
maxf=0;

g1=0;
%intialise population
[initP,acc]=Generate(n,L1,ub,lb);

phi1=zeros(tgen,1);
%next velocity of particles
V_t=zeros(n,L1);

b=initP;
gBest_a=0;
na=0;
temp=1;
clust_no=0;
pbest_fit=zeros(n,L1);
gbest_fit=0;
thresh=zeros(1,K);
for gen=1:tgen
    
%     [th,sig,pos,fit]=Fitness(K,L1,b,His,n);
    [fit,sig,pos]=Fitness(b,n,L,ub,lb,fobj);
    temp(gen)=sig;
    if(gen==1)
    
        pbest_fit=fit;
        gbest_fit=sig;
        pBest=initP;
        gBest=initP(pos,:);
%         thresh=th;
    else
        
        [pBest,gBest,pbest_fit,gbest_fit]=find_best_pso(fit,pbest_fit,gbest_fit,pBest,gBest,n,initP,pos);
    end
    
    if(maxf>sig )
        maxf=sig;
          time_pso=toc;
  gconv_pso=gen;
%         fprintf('\n %f \t %d\t %d %f',maxf,clust_no,gen,time1);
    end
   
    [V_t1]=Generate_v_pso(pBest,gBest,C1,C2,W,initP,n,L1,gen,V_t);
    V_t=V_t1;
    [new_pop,V_t1]=Update_pso(n,L1,V_t,initP,pbest_fit,W);
    V_t=V_t1;
    initP=new_pop;
    b=new_pop;
%    fprintf('\n%f\t%d\t%d',maxf,thresh,gen);
fopt_pso(gen)=maxf;
 end

total= toc;
end
