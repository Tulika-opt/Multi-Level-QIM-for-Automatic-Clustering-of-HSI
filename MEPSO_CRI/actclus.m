function c=actclus(n,b)
bb=1;
d=zeros(n,20);
for i=1:n
bb=b(i,:);    
l=randi([4,12],1,1);
p = randperm(20,l);
for j=1:l
d(i,j)=bb(p(j));   
end
end
c=d;
end