function [ex]=Exm(pE,initP,n,L,eno)
temp=0;
sum=0;
for j=1:n
 for k=1:eno
   for i=1:n
      
          
              sum=sum+(pE(k,:)-initP(i,:));
                         
          
       end
 end
   [v,ex(j)]=min(sum);
end
end