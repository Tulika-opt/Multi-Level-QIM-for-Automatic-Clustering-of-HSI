function [tr,fv,pos,ff]=thcal(L,sa,sb,His,pr,K,n,r)
mx=0;
j=1;
p1=1;
T=zeros(n,K-1);
for i=1:n
saa=sa(i,:);  
sbb=sb(i,:); 
prr=pr(i,:); 

P=partition(K,saa,sbb,prr,L);
[tr1,fv1]=thck(L,His,K,P,r);
f(i)=abs(fv1);
T(i,:)=tr1;
end
[mx,id]=max(f);

tr=T(id,:);
fv=mx;
pos=id;
ff=f;
end