function [M1,M2,M3]=mute(Ca,Cb,Cc,Cp,mu,L,n)
s1=zeros(1,L);
M1=Ca;
M2=Cb;
M3=Cc;
[n1,L1]=size(M1);
for i=1:n1
    for j=1:L1
        if rand<mu
        r=rand;
        if(r<Ca(i,j))
     
               M1(i,j)=Cb(i,j);
               M2(i,j)=Ca(i,j);
       
        else if(r<(Ca(i,j)^2+Cb(i,j)^2)  )
           
               M1(i,j)=Cc(i,j);
               M3(i,j)=Ca(i,j);
           
            else 
              M2(i,j)=Cc(i,j);
               M3(i,j)=Cb(i,j);
        end
        end
        end
    end
end

for i=1:n
    for j=1:L
        if Cp==0
            
            a=(1-(M1(i,j)*M1(i,j)));
            b=rand*0.01;
            c=(a/2)-b;
            M2(i,j)=(sqrt(c));
            M3(i,j)=(sqrt(1-(M1(i,j)*M1(i,j)+M2(i,j)*M2(i,j))));
            if(M1(i,j)<=0 || M2(i,j)<=0 || M3(i,j)<=0 )
                M1(i,j)= 1/sqrt(3);
                M2(i,j)= 1/sqrt(3);
                M3(i,j)= 1/sqrt(3);
            end
        end
        if Cp==1
        
            a=(1-(M2(i,j)*M2(i,j)));
            b=rand*0.01;
            c=(a/2)-b;
            M1(i,j)=(sqrt(c));
            M3(i,j)=(sqrt(1-(M1(i,j)*M1(i,j)+M2(i,j)*M2(i,j))));
            if(M1(i,j)<=0 || M2(i,j)<=0 || M3(i,j)<=0)
                M1(i,j)= 1/sqrt(3);
                M2(i,j)= 1/sqrt(3);
                M3(i,j)= 1/sqrt(3);
                
            end
        end
        if Cp==2
            
            a=(1-(M3(i,j)*M3(i,j)));
            b=rand*0.01;
            c=(a/2)-b;
            M1(i,j)=(sqrt(c));
            M2(i,j)=(sqrt(1-(M1(i,j)*M1(i,j)+M2(i,j)*M2(i,j))));
            if(M1(i,j)<=0 || M2(i,j)<=0 || M3(i,j)<=0)
                M1(i,j)= 1/sqrt(3);
                M2(i,j)= 1/sqrt(3);
                M3(i,j)= 1/sqrt(3);
                
            end
        end
    end
end


end