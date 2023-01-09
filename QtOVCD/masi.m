function [tr1,fv1]=masi(L,His,K,P)
  K=K-1;
   w=zeros(1,K);
   Sr=zeros(1,K);
   im=His';
   r=0.9;
   fv1=0;
   for j=1:K
       if(j==1)
           for i=1:P(j)
               w(j)=w(j)+im(i);
           end
       end
       if(j==K)
           for i=(P(j-1)+1):L
               w(j)=w(j)+im(i);
           end
       end
       if(j>1 && j<K)
           for i=(P(j-1)+1):P(j)          
               w(j)=w(j)+im(i);
           end
       end
   end
   for j=1:K
      if(j==1)
           for i=1:P(j)
               if(im(i)~=0 || isinf(im(i))~=1)
                    lll=im(i)/w(j);
               Sr(j)=Sr(j)+lll;
               end
           end
      end
      if(j==K)
           for i=(P(j-1)+1):L
               if(im(i)~=0|| isinf(im(i))~=1)
                    lll=im(i)/w(j);
               Sr(j)=Sr(j)+lll;
               end
           end
      end
       if(j>1 && j<K)
           for i=(P(j-1)+1):P(j)
               if(im(i)~=0|| isinf(im(i))~=1)
                   lll=im(i)/w(j);
               Sr(j)=Sr(j)+lll;
               end
           end
      end
   end
   for j=1:K
     
       Sr(j)=real((log((1-(1-r))*Sr(j)*log(Sr(j))))/(1-r));
     
   end
  for j=1:K
      if  isfinite(abs(Sr(j)))==1 
          if isreal(abs(Sr(j)==1))
             fv1=fv1+Sr(j);
          end
      end
  end
 tr1=P;
end

