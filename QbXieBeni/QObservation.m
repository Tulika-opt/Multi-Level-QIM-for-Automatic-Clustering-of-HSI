function pm=QObservation(M1,M2,L,n)
p=zeros(n,L);
for k=1:n
for i=1:L
    r=rand;
    if(r<M1(k,i)*M1(k,i))
        p(k,i)=1;
    else
        p(k,i)=2;   
    end
end
end
pm=p;
end