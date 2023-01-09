function M=Generate(n,L)
a=zeros(n,L);
for i=1:n
for k=1:L
    a(i,k)=rand;
end
end
M=a;
end