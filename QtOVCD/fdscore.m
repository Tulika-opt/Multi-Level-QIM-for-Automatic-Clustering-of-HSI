function [eA]=fdscore(p1,dim,gt1,clust_no)
A = histcounts(p1);
A=sqrt(A);
B= histcounts(gt1);
s=size(B);
s=s(2);
M=B;
for i=1:s
   if i<=size(A)
       M(i)=A(i);
   else
       M(i)=1;
   end
end
eA=0;
err=zeros(1,s);
sum=0;
for i=1:s
    err(i)=dist1(M(i),B(i));
  
end   
for i=1:s
    eA=eA+(err(i)/sqrt(M(i)));
      sum=sum+sqrt(1^(1+1/A(i)));
end
eA=(1/((10000)*(dim)))*sum*eA;

end
function d = dist1(x1, x2)

% Euclidean distance
d=abs((x1-x2)^2);



end