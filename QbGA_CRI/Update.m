function [sa,sb]=Update(M1,M2,n,L)
sa=M1;
sb=M2;
for i=1:n
    for j=1:L
        r=rand;
        if r<M1(i,j)^2
            sa(i,j)=r;
            a=(1-(sa(i,j)*sa(i,j)));
            sb(i,j)=sqrt(a);
            
            if(sa(i,j)<=0 || sb(i,j)<=0 )
                sa(i,j)= 1/sqrt(2);
                sb(i,j)= 1/sqrt(2);
                
            end
        else 
                sb(i,j)=r;
                a=(1-(sb(i,j)*sb(i,j)));
                sa(i,j)=sqrt(a);
                if(sa(i,j)<=0 || sb(i,j)<=0 )
                sa(i,j)= 1/sqrt(2);
                sb(i,j)= 1/sqrt(2);
                    
                end
                
               
            end
        end
    end

end