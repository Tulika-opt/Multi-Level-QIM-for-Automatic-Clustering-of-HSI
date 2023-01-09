function [Ca,Cb,Cc,Cp]=cross(Sa,Sb,Sc,Pr,cr,L,n)
s1=Sa;
s2=Sb;
s3=Sc;
pr1=Pr;
Sa1=Sa;
Sb1=Sb;
Sc1=Sc;
Pr1=Pr;

for i=1:floor(n/2)
while 1
  m1=randi([1,n],1,1);
  m2=randi([1,n],1,1);
if(m1~=m2)
 break;
end
end
if(rand<cr)
  pos=randi([1,L],1,1);  
  s1(m1,1:pos)=Sa(m1,1:pos);
  s1(m1,pos+1:L)=Sa(m2,pos+1:L);
  s2(m1,1:pos)=Sb(m1,1:pos);
  s2(m1,pos+1:L)=Sb(m2,pos+1:L);
  s3(m1,1:pos)=Sc(m1,1:pos);
  s3(m1,pos+1:L)=Sc(m2,pos+1:L);
  pr1(m1,1:pos)=Pr(m1,1:pos);
  pr1(m1,pos+1:L)=Pr(m2,pos+1:L);
  
  s1(m2,pos+1:L)=Sa(m1,pos+1:L);
  s1(m2,1:pos)=Sa(m2,1:pos);
   s2(m2,pos+1:L)=Sb(m1,pos+1:L);
  s2(m2,1:pos)=Sb(m2,1:pos);   
   s3(m2,pos+1:L)=Sc(m1,pos+1:L);
  s3(m2,1:pos)=Sc(m2,1:pos); 
    pr1(m2,pos+1:L)=Pr(m1,pos+1:L);
  pr1(m2,1:pos)=Pr(m2,1:pos);
end
  Sa1(m1,:)=s1(m1,:);
  Sa1(m2,:)=s1(m2,:); 
  Sb1(m1,:)=s2(m1,:);
  Sb1(m2,:)=s2(m2,:); 
  Sc1(m1,:)=s3(m1,:);
  Sc1(m2,:)=s3(m2,:); 
  Pr1(m1,:)=pr1(m1,:);
  Pr1(m2,:)=pr1(m2,:); 
end
  Ca=Sa1;
  Cb=Sb1;
  Cc=Sc1;
  Cp=Pr1;
end