function [pB,gB,pbest_fit,gbest_fit,p_exp]=find_best(fit,pbest_fit,gbest_fit,pBest,gBest,n,initP,pos)

for i=1:n
    if(pbest_fit(n)<fit(n))
        pBest(i,:)=initP(i,:);
        pbest_fit(i)=fit(i);
    end
end
for i=1:n/3
    p_exp(i,:)=pBest(i,:);
end
if (pos~=0)
    if(gbest_fit<fit(pos))
        gBest=initP(pos,:);
        gbest_fit=fit(pos);
    end
end
pB=pBest;
gB=gBest;

end