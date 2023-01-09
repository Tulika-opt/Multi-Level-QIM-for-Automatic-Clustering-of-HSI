function [img2,ctt,h]=insert(x)
 img=imread('pav_1cnn.tif');
    img3=rgb2gray(img);
    img2=imadjust(img3);
       img2=im2double(img2);
%     img=imread('pav_1cnn.tif');
%     img3=rgb2gray(img);
%     img2=imadjust(img3);
%        img2=im2double(img2);
%     img3=rgb2gray(img2);
%     img1=imadjust(img3);
%    H = fspecial('average',[3,3]);
% I = imfilter(img3,H,'symmetric');
%      ii=imsharpen(I);
%      I1=imsharpen(ii);
    [row,col]=size(img2);
i=1;
e=1;
% while(i<=row*col)
% e(i)=img2(i);
% i=i+1;
% end
e=reshape(img2,1,[row*col]);
range=max(e)-min(e);
f=(e-min(e))/range;
ctt=mean(f);
h=f;
end