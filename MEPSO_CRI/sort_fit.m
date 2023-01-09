function  [M1,fit,V_t]=sort_fit(fit,a1,n,L,V_t)
   [b,id]=sort(fit);
   V_t1=zeros(n,L);
        for i=1:n
            k=id(i);
            for j=1:L
                
                sa(i,j)=a1(k,j);
              
                V_t1(i,j)=V_t(k,j);
            end
               
        end
     M1=sa;
  
 
     fit=b;
     V_t=V_t1;
           
       
end
