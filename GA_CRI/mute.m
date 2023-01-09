function MU=mute(C,mu,L,n,p)
s1=zeros(1,L);
for i=1:n
for j=1:L    
if(rand<mu)
C(i,j)=rand;  
end  
end
end
  D=sqrt(1-C.^2);
  D(n,:)=p;
  MU=D;
end