function [S1,S2,S3,Pr1,fit1]=selection(sa,sb,sc,pr,n,fv)
s1=sa;
s2=sb;
s3=sc;
pr1=pr;
fit1=fv;
for i=1:n
    while 1
        m1=randi([1,n],1,1);
        m2=randi([1,n],1,1);
        if(m1~=m2)
            break;
        end
    end
  
        if(fv(m1)>fv(m2))
            
            s1(i,:)=sa(m1,:);
            s2(i,:)=sb(m1,:);
            s3(i,:)=sc(m1,:);
            pr1(i,:)=pr(m1,:);
            fit1(i)=fv(m1);
            
        else
            s1(i,:)=sa(m2,:);
            s2(i,:)=sb(m2,:);
            s3(i,:)=sc(m2,:);
            pr1(i,:)=pr(m2,:);
             fit1(i)=fv(m2);
        end
    end
    S1=s1;
    S2=s2;
    S3=s3;
    Pr1=pr1;
end