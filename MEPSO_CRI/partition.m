% function [thresh]=partition(L,k,hist)
%  st=0;
%     j=1;
%    f=0;
%    while(1)
%     pb1=randi([1,L-1],1,1);
%     pm=rand;
%     if(pm>hist(pb1)*hist(pb1) && pb1~=f)
%       st(j)=pb1;
%       f=pb1;
%       j=j+1;
%     end
%      if(j==k)
%         break;
%     end
%    end
% thresh=sort(st);
function P=partition(K,saa,L)
f=0;
st=zeros(1,K-1);
j=1;
while(1)
    pb=randi([1,L-1],1,1);
    pm=rand;%probability factor
    if(pm>saa(pb)*saa(pb) && pb~=f)   
      st(j)=pb;
      f=pb;
      j=j+1;
    end
   
 if(j==K)
        break;
 end
end
P=st;
end
