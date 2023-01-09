function pm=QObservation(M1,M2,M3,L,n)
p=zeros(n,L);
for k=1:n
for i=1:L
    r=rand;
    if(r<M1(k,i)*M1(k,i))
        p(k,i)=1;
    elseif(r<M1(k,i)*M2(k,i)+M2(k,i))
        p(k,i)=2;   
    else
        p(k,i)=3;
    end
end
end
pm=p;
end