function  [M1,M2,M3,pr,fit1]=sort_fit(fit,a1,a2,a3,n,pr,L)
   [b,id]=sort(fit);
   f1=zeros(n,1);
   pf=zeros(n,1);
         for i=1:n
            k=id(i);
           
                
                sa(i,:)=a1(k,:);
                sb(i,:)=a2(k,:);
                sc(i,:)=a3(k,:);
                pr1(i,:)=pr(k,:);
               
                f1(i)=fit(k);
              
        end
     M1=sa;
     M2=sb;
     M3=sc;
     fit1=f1;
  
     
           
       
end
