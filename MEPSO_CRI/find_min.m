function [pB,fit_best]=find_min(n,L,M1,pos,fit,best_fit,pbest);                                                                                                                                                         
pB=zeros(n,L);
gB=zeros(n,L);
pBest1=zeros(n,L);
for i=1:n
    pBest1(i,:)=M1(i,:);
   end

   for i=1:n
       if(fit(i)>best_fit(i))
           pBest1(i,:)=pbest(i,:);
       else
             best_fit(i)=fit(i);
       end
   end
  
 pB=pBest1; 
 fit_best=best_fit;
 
end