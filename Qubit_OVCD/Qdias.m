function [M1,M2,fit1]=Qdias(sa,sb,n,L,fit)
m=round(n*0.2);
fit1=fit;
k=m;
[t,idx]=sort(fit1);
for i=1:m
    
    sa(idx(i),:)=1/sqrt(2);
    sb(idx(i),:)=1/sqrt(2);
    
    fit1(idx(i))=0;
 end

M1=sa;
M2=sb;

end