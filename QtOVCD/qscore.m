function [eA]=qscore(p1,dim,gt1,clust_no)
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
    eA=eA+(err(i)/(1+M(i))+((1/M(i))^2));
end
eA=(1/(10000)*(dim))*sqrt(clust_no)*eA;

end
function d = dist1(x1, x2)

% Euclidean distance
d=abs((x1-x2)^2);



end