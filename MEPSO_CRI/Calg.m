function [ggi]=Calg(gB,initP,n,L)
temp=0;
gi=zeros(n,1);
gB=gB';
for i=1:n
    for j=1:L
       if(j==1)
           temp=initP(i,j);
       else
           if(abs(gB-initP(i,j))>abs(gB-temp))
               temp=initP(i,j);
           end
       end
 gi(i)=(sqrt(gB(i)-temp)^2)/((sqrt(gB(i)-temp)^2)+sqrt(initP(i,j)-gB(i))^2);
    end
    
end
ggi=gi;
end