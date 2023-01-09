function [ob,c]=obcv(ccc,h,L,no,ctt)
n=size(h);
ob=0;
V=ccc';
X=h;
m=2;
pd = makedist('Normal');
pck=zeros(n);
c1=zeros(n);

p1=zeros(1,no);

for i=1:n(2)
    for j =1: no
        % compute partition matrix entries

            U(j,i) = membership(h(i),V, j, m, no);
            p1(j)=pdf(pd,(V(j)/h(i)));
    end
    [temp,c(i)]=max(p1);
    for j=1:no
        if(temp==p1(j))
            p1(j)=0;
        end
    end
    pck(i)=max(p1);
end

for i=1:n
   ob=ob+(pdf(pd,(V(c(i))/h(i)))-pck(i));
end
ob=ob/n(2);
end

function Uji = membership(Xi, Z, j1, m, no)

% Partition matrix calculation
Uji = 0;
 temp1=dist(Xi,Z(j1));
for j = 1:no
   
    temp=(dist(Xi,Z(j)));
    Uji = Uji +(temp1/temp);
end
p=(-1/(m-1));
if(Uji>0)
Uji = Uji^p;
end
end
function d = dist(x1, x2)

% Euclidean distance
d=abs((x1-x2)^2);



end