function S=selection(sa,n,fv,L)
for i=1:n
while 1
  m1=randi([1,n],1,1);
  m2=randi([1,n],1,1);
if(m1~=m2)
 break;
end
end
for j=1:L
if(fv(m1)>fv(m2))

    s1(i,:)=sa(m1,:);
   
else
  s1(i,:)=sa(m2,:);    
end
end
  S=s1;
end