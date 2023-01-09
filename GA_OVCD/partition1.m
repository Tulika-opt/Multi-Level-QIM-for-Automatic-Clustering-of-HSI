function [Q]=partition1(K,s,L,n)
st=0;
j1=1;
d2=s(1,:);
temp=K-1;
% for i=1:L
%     d2(i)=s(1,i);
% end
p=0;
for i=1:L
    pm=rand;%probability factor
    if(pm>d2(i)*d2(i)) 
      j1=j1+1;  
      st(j1)=i;
    end    
end
%   an=randi([4,n],1,1);
for k1=1:n
  for k2=1:temp
  p(k2)=randi([st(1),st(j1)],1,1); 
  end
  P=sort(p);
  P2(k1,:)=P;
end
Q=P2;
% m=an;
end
