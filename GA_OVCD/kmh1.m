function [XB,U]=kmh1(ccc,h,L,no,ctt)
p=8;
[r,c]=size(h);
s=zeros(no,c);
nk=0;
l=zeros(1,c);
wt=zeros(1,c);
[N,d] = size(h);
V=ccc';
X=h;
m=2;
% Var_X=var(h);
XB=0;
vdis=0;
for i=1:c
    for j =1: no
        % compute partition matrix entries

            U(j,i) = membership(X(i),V, j, m, no);
   
    end
end
% calculate the objective function and print the results
OJ = zeros(no,1);
J=U;
for i = 1:no
    for j = 1:c
        temp=dist(X(j), V(i));
        if(isnan(OJ(i))==0)
        OJ(i) = OJ(i) + (U(i,j)^m)*temp;
        end
    end
end

for i=1:no
 for k=1:no
            temp1=dist(V(i), V(k));
            vdis(i,k)=temp1;
 end
end
v1=min(vdis(vdis>0));
if(isnan(sum(OJ))==0)
XB=sum(OJ)/(c*v1);
else 
    XB=0;
end
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
Uji = Uji^p;
end
function d = dist(x1, x2)

% Euclidean distance
d=abs((x1-x2)^2);



end