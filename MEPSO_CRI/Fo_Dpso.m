function [phic,img2,th2,gconv,gtime,total]=Fo_Dpso(temp1)

    tic;
n=15;
nmin=10;   %min no of particles in each swarm
nmax=30;   %max no of particles in each swarm
K=4;
alpha=0.79; %fractional coefficient
rho1=1.2;  %global weight
rho2=0.8;  %local weight

delv=5;    %max no of levels a particles cn travel btw iterations

ns=4;      %initial no of swarms
nsmin=2;   %min no of swarms
nsmax=6;   %max no of swarms

iter=1000;   %total no of iterations
ikill=10;  %max stagnation of swarms

nkill=10;

maxf=0;
thresh=0;

s=0;
gconv=0;
gtime=0;

[His,img2,L1]=insert();

for sw=1:ns
    S1(sw)=Swarm();
    S1(sw).M1=Generate(L1,n);
    S1(sw).V_t1=zeros(n,L1);
    S1(sw).V_t2=zeros(n,L1);
    S1(sw).V_t3=zeros(n,L1);
    S1(sw).V_t4=zeros(n,L1);
    S1(sw).n=n;
    S1(sw).pbest_fit=zeros(n,1);
    S1(sw).pbest=zeros(n,L1);
    S1(sw).gbest=zeros(n,L1);
    S1(sw).gbest_fit=0;
    S1(sw).gbest_p=0;
    S1(sw).ik=0;
end
na=0;
temp=1;

c1=0;
c2=0;

temp=zeros(iter,sw);
pos1=zeros(iter,sw);
phic=0;
thresh1=0;
c3=0;
for g=1:iter
    if c3==0
    for sw=1:ns
        
        [S1(sw).th,S1(sw).sig,S1(sw).pos,S1(sw).fit]=Fitness(K,L1,S1(sw).M1,His,S1(sw).n);
      
        
        if(g==1 || c1==1 || c2==1)
             S1(sw).maxf=S1(sw).sig;
            S1(sw).pbest_fit=S1(sw).fit;
           S1(sw).gbest_fit=S1(sw).fit(S1(sw).pos);
            S1(sw).gbest_p=S1(sw).pos;
            S1(sw).thresh=S1(sw).th;
           
            for i=1:S1(sw).n              
                S1(sw).pbest(i,:)=S1(sw).M1(i,:);             
            end
            for i=1:n
                S1(sw).gbest(i,:)=S1(sw).pbest(S1(sw).pos,:);
            end
         c1=0;
         c2=0;
        end
        
        if(g>1)
            [S1(sw).pbest,S1(sw).pbest_fit]=find_min(S1(sw).n,L1,S1(sw).M1,S1(sw).pos,S1(sw).fit,S1(sw).pbest_fit,S1(sw).pbest);
                    
        end
        
        if(S1(sw).maxf<S1(sw).sig)
            S1(sw).maxf=S1(sw).sig;
            S1(sw).thresh=S1(sw).th;
        end
        [S1(sw).V_t1,S1(sw).V_t2,S1(sw).V_t3,S1(sw).V_t4]=Generate_v(S1(sw).M1,S1(sw).pbest,S1(sw).gbest,S1(sw).n,L1,S1(sw).V_t1,S1(sw).V_t2,S1(sw).V_t3,S1(sw).V_t4,alpha,rho1,rho2,delv,g);
        [M1,V_t]=Update(S1(sw).n,S1(sw).M1,S1(sw).V_t1,S1(sw).pbest,S1(sw).gbest,L1);
        S1(sw).M1=M1;
        S1(sw).V_t1=V_t;
       
        [M1,fit,V_t]=sort_fit(S1(sw).fit,S1(sw).M1,S1(sw).n,L1,S1(sw).V_t1);
        S1(sw).M1=M1;
      
    
        S1(sw).fit=fit;
        S1(sw).V_t1=V_t;
        
    end
    sw=0;


for sw1=1:ns
  if c3>0 && s~=0
      sw1=s;
  end
    if phic<S1(sw1).maxf
        
        phic=S1(sw1).maxf;
        t=toc;
        gconv=g;
        gtime=t;
%          fprintf('\n Gen-%d\t phic %f\t time %f',g,phic,t);
        thresh1=S1(sw1).thresh;
        S1(sw1).gbest_fit=S1(sw1).pbest_fit(S1(sw1).pos);
        for i=1:S1(sw1).n
            S1(sw1).gbest(i,:)=S1(sw1).pbest(S1(sw1).pos,:);
        end
        S1(sw1).ik=0;
        
        if S1(sw1).n<nmax
            t1=S1(sw1).n;
            S1(sw1).n=S1(sw1).n+1;
            c1=1;
            
            for k=1:L1
                [Me1]=Generate(L1,1);
                S1(sw1).M1(S1(sw1).n,:)=Me1;          
                S1(sw1).pbest_fit(S1(sw1).n)=0;
                S1(sw1).pbest(S1(sw1).n,k)=0;
                S1(sw1).V_t1(S1(sw1).n,k)=0;
                S1(sw1).V_t2(S1(sw1).n,k)=0;
                S1(sw1).V_t3(S1(sw1).n,k)=0;
                S1(sw1).V_t4(S1(sw1).n,k)=0;
                S1(sw1).gbest(S1(sw1).n,k)=S1(sw1).gbest(t1,k);
            
            end
            
            if (ns<nsmax && (rand(1)*(ns/nmax)>rand(1)))
                ns=ns+1;
                c2=1;
                [M1]=Generate(L1,n);
                S1(ns).M1=M1;
                S1(ns).n=n;
                S1(ns).V_t1=zeros(S1(ns).n,L1);
                S1(ns).V_t2=zeros(S1(ns).n,L1);
                S1(ns).V_t3=zeros(S1(ns).n,L1);
                S1(ns).V_t4=zeros(S1(ns).n,L1);
                S1(ns).pbest_fit=zeros(S1(ns).n);
                S1(ns).pbest=zeros(S1(ns).n,L1);
                S1(ns).gbest=zeros(S1(ns).n,L1);
                S1(ns).gbest_fit=0;
                S1(ns).gbest_p=0;
                S1(ns).th=0;
                S1(ns).pos=0;
                S1(ns).sig=0;
                S1(ns).fit=zeros(S1(ns).n,L1);
                S1(ns).maxf=0;
                
                S1(ns).ik=0;
                
            end
        end
    else
        S1(sw1).ik=S1(sw1).ik+1;
        if S1(sw1).ik>=ikill 
            if S1(sw1).n>nmin
                t1=S1(sw1).n;
                S1(sw1).M1(t1,:)=[];
                S1(sw1).V_t1(t1,:)=[];
                S1(sw1).V_t2(t1,:)=[];
                S1(sw1).V_t3(t1,:)=[];
                S1(sw1).V_t4(t1,:)=[];
                S1(sw1).pbest_fit(t1)=[];
                S1(sw1).pbest(t1,:)=[];
                
                S1(sw1).n=S1(sw1).n-1;
            else
                S1(sw1)=[];
                ns=ns-1;
                s=ns-1;
                c3=c3+1;
                
                
            end
        end
    end
    end
end

%     fprintf('\n %d \t %d',g,numel(thresh1));
  end
    
th1=sort(thresh1);
th2=unique(th1);
na=numel(th2);
total=toc;

end
