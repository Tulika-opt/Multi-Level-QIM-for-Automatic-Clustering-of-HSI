function P=partition(K,saa,sbb,prr,L)
f=0;
st=zeros(1,K-1);
j=1;
while(1)
    pb=randi([1,L-1],1,1);
    pm=rand;%probability factor
    if(prr(pb)==1)
    if(pm>saa(pb)*saa(pb) && pb~=f)   
      st(j)=pb;
      f=pb;
      j=j+1;
    end
    end
    if(prr(pb)==2)
    if(pm>sbb(pb)*sbb(pb) && pb~=f)   
      st(j)=pb;
      f=pb;
      j=j+1;
    end
    end
    
    if(j==K)
        break;
    end
end
P=st;
end
