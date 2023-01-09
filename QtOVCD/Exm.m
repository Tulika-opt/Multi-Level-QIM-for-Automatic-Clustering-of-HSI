function [ex]=Exm(pE,M1,M2,pr,n,L,eno)
temp=0;
sum=0;
for j=1:n
 for k=1:eno
   for i=1:n
      for m=1:L
         if(pr(i,m)==1)
              sum=sum+(pE(k,:)-M1(i,:));
         end  
         if(pr(i,m)==2)
              sum=sum+(pE(k,:)-M2(i,:));
         end  
         end  
       end
 end
   [v,ex(j)]=min(sum);
end
end