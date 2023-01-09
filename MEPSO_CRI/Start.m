%  load('PaviaU.mat');
 load('data.mat');

% img1=paviaU;
img=all_x;
 img1=mat2gray(img);
row=500;
col=260;
dim=436;
R=zeros(dim,1);
E=zeros(dim,1);
% img=mat2gray(img1);
% [row,col,dim]=size(img);
% img1=reshape(img,[row*col,dim]);
R=zeros(dim,1);
E=zeros(dim,1);
for i=1:dim
    if(i>1)
    j=i-1;
    Bi=mean(img1(:,i));
    Bj=mean(img1(:,j));
    R(i)=sum((img1(:,i)-Bi).*(img1(:,j)-Bj))/sqrt(sum((img1(:,i)-Bi).^2).*sum((img1(:,j)-Bj).^2));
    end
    E(i)=(1/dim)*entropy(img1(:,i));
end
 [sband,ig]=band_selection(E);
 I1=reshape(img1,[row,col,dim]);

% [ig,idx]=sort(ig,'descend');
% 
% for i=1:3
%     band(i)=sband(idx(i));
% end
% for i=1:3
%     img_seg(:,:,i) = (img(:,:,band(i)));
% end

