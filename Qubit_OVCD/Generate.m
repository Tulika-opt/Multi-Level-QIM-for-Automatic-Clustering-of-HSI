function [M1,M2]=Generate(L,n)
a=zeros(n,L);
b=zeros(n,L);

for k=1:n
for i=1:L
    a(k,i)=1/sqrt(2);
    b(k,i)=1/sqrt(2);
end
end
M1=a;
M2=b;
%Generate initial L particles
end