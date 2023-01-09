
function [tr,fv,pos,fb]=thcal(L,s,His,K,n,r)

j=1;
p=1;
P=partition1(K,s,L,n);
T=zeros(n,K-1);
for i=1:n
[tr1,fv1]=thck(L,His,K,P(i,:),r);
f(i)=fv1;
T(i,:)=tr1;
end
[mx,id]=max(f);
% if(i==1)
%     mx=fv1;
% end
% if(mx<f(i))
%     mx=f(i);
%     T=tr1;
%     p=i;
% end
% 
% end
tr=T(id,:);
fb=f;
fv=mx;
pos=id;
end