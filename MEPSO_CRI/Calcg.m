function [cgi]=Calcg(initP,n,L,exm,eno)
temp=0;
exm=exm';
for i=eno:n
    for j=1:L
       if(j==1)
           temp=initP(exm(i),j);
       else
           if(abs(initP(exm(i),j)-initP(i,j))>abs(initP(exm(i),j)-temp))
               temp=initP(exm(i),j);
           end
       end
 cgi(i,j)=(sqrt(initP(exm(i),j)-temp)^2)/((sqrt(initP(exm(i),j)-temp)^2)+sqrt(initP(i,j)-initP(exm(i),j))^2);
    end
    
end
end