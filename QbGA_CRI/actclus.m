function c=actclus(n,b)
bb=1;
d=zeros(n,14);
for i=1:n
bb=b(i,:);    
l=randi([4,10],1,1);
p = randperm(14,l);
for j=1:l
d(i,j)=bb(p(j));   
end
end
c=d;
end