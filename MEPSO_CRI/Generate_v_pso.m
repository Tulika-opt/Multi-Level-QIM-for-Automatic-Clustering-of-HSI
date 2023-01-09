function [V1]=Generate_v(pB,gB,pE,W,initP,n,L,gen,V_t,eno)
V1=zeros(n,L);


ggi=Calg(gB,initP,n,L);

exm=Exm(pE,initP,n,L,eno);
cgi=Calcg(initP,n,L,exm,eno);
mu=1.4;
for i=1:n
    
    V1(i,:)=W*V_t(i,:)+(mu*rand.*(pB(i,:)-initP(i,:)))+(ggi(i,:).*mu*rand.*(gB-initP(i,:))+(cgi(i,:).*mu*rand.*(initP(exm(i))-initP(i,:))));
end
end