function [M1,M2,M3]=Generate(L,n)
a=zeros(n,L);
b=zeros(n,L);
c=zeros(n,L);

for k=1:n
for i=1:L
    a(k,i)=1/sqrt(3);
    b(k,i)=1/sqrt(3);
    c(k,i)=1/sqrt(3);
end
end
M1=a;
M2=b;
M3=c;
%Generate initial L particles
end