function [M1,M2]=mute(Ca,Cb,Cp,mu,L,n)
s1=zeros(1,L);
M1=Ca;
M2=Cb;
[n1,L1]=size(M1);
for i=1:n1
    for j=1:L1
        if rand<mu
        r=rand;
        if(r<Ca(i,j))
     
               M1(i,j)=Cb(i,j);
               M2(i,j)=Ca(i,j);
       
        else 
           
               M2(i,j)=Cb(i,j);
               M1(i,j)=Ca(i,j);
           
          
        end
        end
        end
end

for i=1:n
    for j=1:L
        if Cp==1
            
            a=(1-(M1(i,j)*M1(i,j)));
            M2(i,j)=(sqrt(a));
         
            if(M1(i,j)<=0 || M2(i,j)<=0  )
                M1(i,j)= 1/sqrt(2);
                M2(i,j)= 1/sqrt(2);
                
            end
        end
        if Cp==2
        
            a=(1-(M2(i,j)*M2(i,j)));
           
            M1(i,j)=(sqrt(a));
          
            if(M1(i,j)<=0 || M2(i,j)<=0 )
                M1(i,j)= 1/sqrt(2);
                M2(i,j)= 1/sqrt(2);
            
                
            end
        end
       
        end
end


end