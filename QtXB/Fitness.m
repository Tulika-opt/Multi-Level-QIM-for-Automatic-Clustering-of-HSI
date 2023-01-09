function [m1,clust1,maxi,id,c_center,part_im1]=Fitness(img,n,L,h,ctt,M1,M2,M3,pr,image1)
maxi=zeros(n,1);
idx=0;
n1=zeros(n,1);
m1=0;
q=1;
t1=0;
clust=0;
id1=0;
im1=h;
c_center=0;
[ss,s1]=size(h);
e = 0;
part_im1=0;
for i=1:n
    cc=img(i,:);
    saa=M1(i,:);
    sbb=M2(i,:);
    scc=M3(i,:);
    prr=pr(i,:);
    ccc=1;
    ct=1;
    for v=1:L
        if(cc(v)~=0)
            if prr(v)==1
                ccc(ct)=saa(v);
                ct=ct+1;
            end
            if prr(v)==2
                ccc(ct)=sbb(v);
                ct=ct+1;
            end
            if prr(v)==3
                ccc(ct)=scc(v);
                ct=ct+1;
            end
        end
        
    end
    dk=0;
    nc=numel(ccc);
    clust(i)=nc;
  
    if nc>3
   [XB,part_image]=kmh1(ccc,h,L,nc,ctt);
maxi(i)=XB;
   if i==1
       c_center=ccc;
       e=i;
       part_im1=part_image;
   else 
       if XB<maxi(e)
         c_center=ccc;
         e=i; 
          part_im1=part_image;
       end
   end
    end
end
 [m1,id]=min(maxi);
 clust1=clust(id);
 
 ct=1;
%  if pr(id)==1
%   s1=M1(id,:);
%  end
%    if pr==1
%   s1=M1(id,:);
%    end
%   if pr==1
%   s1=M1(id,:);
%  end
%   for v=1:20
%         if(cc(v)~=0)
%             
%                 im2(ct)=s1(v);
%                 ct=ct+1;
%            
%         end
%         
%     end
end

