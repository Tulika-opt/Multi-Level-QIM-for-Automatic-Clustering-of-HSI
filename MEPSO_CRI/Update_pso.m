function [new_pop,V_t1]=Update(n,L,V_t,initP,f,W)
V_t1=V_t;
   for i=1:n
       f1=f(i);
       for j=1:L
          
          new_pop(i,j)=initP(i,j)+V_t(i,j);
           if new_pop(i,j)<=0 || new_pop(i,j)>=1 || f1==0 || isnan(new_pop(i,j))==1
           new_pop(i,j)=rand;
           V_t1(i,j)=0;
           end
   end
   end
end