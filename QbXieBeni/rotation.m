function [M1,M2]= rotation(M1,M2,pr,n,L)
   for i=1:n
       for j=1:L
           if pr(i,j)==1
               M1(i,j)=M1(i,j)*0.001*rand;
               M2(i,j)=real(sqrt(((1-(M1(i,j)^2))/2)-rand));
            
               if (M1(i,j)>1 || M1(i,j)<=0)||(M2(i,j)>1 || M2(i,j)<=0)
                   M1(i,j)=1/sqrt(2)-rand;
                  
                    M2(i,j)=real(sqrt(1-((M1(i,j)^2))));;
                 
               end
           end
           if pr(i,j)==2
               M2(i,j)=M2(i,j)*0.001*rand;
               M1(i,j)=real(sqrt(((1-(M2(i,j)^2))/2)-rand));
              
               if (M1(i,j)>1 || M1(i,j)<=0)||(M2(i,j)>1 || M2(i,j)<=0)
                  M1(i,j)=1/sqrt(2)-rand;
                  
                    M2(i,j)=real(sqrt(1-((M1(i,j)^2))));;
                 
               end
           end
           
       end
   end
end