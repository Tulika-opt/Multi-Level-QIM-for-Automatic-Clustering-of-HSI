function [tr1,Sr]=thck(L,His,K,P,r)
im=His;
tr1=0;
w=zeros(1,K);
muk=zeros(1,K);
mul=zeros(1,K);
ca=zeros(1,K);
mu=0;
Hn=zeros(K,1);
P=sort(P);
Ps=zeros(K,1);
Sr=0;
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
              if (im(i)>0)
                muk(j)=muk(j)+im(i)/w(j);
                mul(j)=mul(j)+log(im(i)/w(j));
              end
         end
         t=(abs(1-(1-r)*muk(j)*mul(j)));
         ca(j)=log(t)/(1-r);
    end
    if(j==K)
          for i=(P(j-1)+1):L
              if (im(i)>0)
                muk(j)=muk(j)+im(i)/w(j);
                mul(j)=mul(j)+log(im(i)/w(j));
              end
         end
          t=(abs(1-(1-r)*muk(j)*mul(j)));
         ca(j)=log(t)/(1-r);
    end
    if(j>1 && j<K)
          for i=(P(j-1)+1):P(j)
              if (im(i)>0) 
                muk(j)=muk(j)+im(i)/w(j);
                mul(j)=mul(j)+log(im(i)/w(j));
              end
          end
         t=(abs(1-(1-r)*muk(j)*mul(j)));
         ca(j)=log(t)/(1-r);
    end
end
for j=1:K
    Sr=Sr+ca(j);
end
tr1=P;
end