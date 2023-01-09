function [tr1,fv1]=thck(L,His,K,P)
im=His;
w=zeros(1,K);
muk=zeros(1,K);
mu=0;
Hn=zeros(K,1);
P=sort(P);
Ps=zeros(K,1);
sigb=0;    
    for j=1:K
        if(j==1)
             for i=1:P(j)
              
                w(j)=w(j)+im(i);
                muk(j)=muk(j)+i*im(i); 
             end
        end
        if(j==K)
              for i=(P(j-1)+1):L
                 
                
                w(j)=w(j)+im(i);
                muk(j)=muk(j)+i*im(i);
              end
        end
        if(j>1 && j<K)
              for i=(P(j-1)+1):P(j)
                
              
                w(j)=w(j)+im(i);
                muk(j)=muk(j)+i*im(i);
              end          
        end
    end

for i=1:K
    
  if(w~=0)
   
    sigb=sigb+(muk(i)^2)/w(i);
  else
     sigb=sigb;
  end
end    
    fv1=sigb;
    tr1=P;
end