function C=cross(S,cr,L,n)
s1=zeros(n,L);
C=S;
for i=1:floor(n/2)
while 1
  m1=randi([1,n],1,1);
  m2=randi([1,n],1,1);
if(m1~=m2)
 break;
end
end
if(rand<cr)
  pos=randi([1,L],1,1);  
  s1(m1,1:pos)=S(m1,1:pos);
  s1(m1,pos+1:L)=S(m2,pos+1:L);
  s1(m2,pos+1:L)=S(m1,pos+1:L);
  s1(m2,1:pos)=S(m2,1:pos);   
end
  S(m1,:)=s1(m1,:);
  S(m2,:)=s1(m2,:);  
end
  C=S;
end