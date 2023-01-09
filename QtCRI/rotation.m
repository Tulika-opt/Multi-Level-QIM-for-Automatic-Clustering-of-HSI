function [M1,M2,M3]= rotation(M1,M2,M3,pr,n,L)
   for i=1:n
       for j=1:L
           if pr(i,j)==1
               M1(i,j)=M1(i,j)*0.001*rand;
               M2(i,j)=real(sqrt(((1-(M1(i,j)^2))/2)-rand));
               M3(i,j)=real(sqrt(1-((M1(i,j)^2)+M2(i,j)^2)));
               if (M1(i,j)>1 || M1(i,j)<=0)||(M2(i,j)>1 || M2(i,j)<=0)||(M3(i,j)>1 || M3(i,j)<=0)
                   M1(i,j)=1/sqrt(3);
                   M2(i,j)=1/sqrt(3);
                   M3(i,j)=1/sqrt(3);
               end
           end
           if pr(i,j)==2
               M2(i,j)=M2(i,j)*0.001*rand;
               M3(i,j)=real(sqrt(((1-(M2(i,j)^2))/2)-rand));
               M1(i,j)=real(sqrt(1-((M3(i,j)^2)+M2(i,j)^2)));
               if (M1(i,j)>1 || M1(i,j)<=0)||(M2(i,j)>1 || M2(i,j)<=0)||(M3(i,j)>1 || M3(i,j)<=0)
                   M1(i,j)=1/sqrt(3);
                   M2(i,j)=1/sqrt(3);
                   M3(i,j)=1/sqrt(3);
               end
           end
           if pr(i,j)==3
               M3(i,j)=M3(i,j)*0.001*rand;
               M1(i,j)=real(sqrt(((1-(M3(i,j)^2))/2)-rand));
               M2(i,j)=real(sqrt(1-((M1(i,j)^2)+M3(i,j)^2)));
               if (M1(i,j)>1 || M1(i,j)<=0)||(M2(i,j)>1 || M2(i,j)<=0)||(M3(i,j)>1 || M3(i,j)<=0)
                   M1(i,j)=1/sqrt(3);
                   M2(i,j)=1/sqrt(3);
                   M3(i,j)=1/sqrt(3);
               end
           end
       end
   end
end