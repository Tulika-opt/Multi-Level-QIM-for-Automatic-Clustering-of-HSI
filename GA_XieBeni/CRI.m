function [CI,s]=CRI(ccc,h,L,no,U)
sum=0;
p=size(h)
m=0;
id=0;
num=zeros(1,no+1);
num1=0;
dnm1=zeros(1,no+1);
dnm2=zeros(1,no+1);
s=zeros(1,p(2));
occ=zeros(1,no+1);
occ_sum=zeros(1,no+1);
for i=1:p(2)
     [m,s(i)]=max(U(:,i));
     for j=1:no+1
         if(s(i)==j)
             occ(j)=occ(j)+1;
             occ_sum(j)=occ_sum(j)+m;
         end
     end
end

   for i=1:no
      for j=1:p(2)
          if(s(j)==i)
          num(i)=num(i)+abs(U(i,j)-occ_sum(i))*(U(i,j)-occ_sum(i+1));
          dnm1(i)=dnm1(i)+(abs(U(i,j)-occ_sum(i))^2);
          dnm2(i)=dnm2(i)+(abs(U(i,j)-occ_sum(i+1))^2);
          end
  
      end
      for i=1:no
         if isnan(num(i))==1 || isnan(dnm1(i))==1 || isnan(dnm2(i))==1 
             num(i)=0;
             dnm1(i)=0;
             dnm2(i)=0;
         end
          
      end
   for i=1:no
        if num(i)~0 || dnm1(i)~=0  ||dnm2(i)~=0
       num1=num1+1+(num(i)/sqrt(dnm1(i)*dnm2(i)));
        end
   end
   num1=1/(no*(no-1))*num1;
   sum=0;
   for i=1:no
          if num(i)~0 || dnm1(i)~=0  ||dnm2(i)~=0
      sum=sum+(1/(abs(ccc(i))*abs(ccc(i)-1)))* 1+(num(i)/sqrt(dnm1(i)*dnm2(i)));
          end
          end
   CI=(num1/sum);
end