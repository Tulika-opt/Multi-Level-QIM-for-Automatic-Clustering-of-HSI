phic=0;
gc=0;
seg_image=0;
for temp1=1:50
    [clust_center,img2,maxf,clust_no,gtime,s_image,conv]=QutritGA();
    s=0;
    %    for i=1:610*340
    %        [m,id]=max(s_image(:,i));
    %        s(i)=id;
    %    end
     mi=reshape(s_image,[145,145]);
    img=label2rgb(mi);
    f=fscore(s_image,145*145,mi,clust_no);
    fd=fdscore(s_image,145*145,mi,clust_no);
    q=qscore(s_image,145*145,mi,clust_no);
    load('Indian_pines_gt (2).mat');
    r1=indian_pines_gt;
    r2=label2rgb(r1);
    
%     mi=reshape(s_image,[500,260]);
%     img=label2rgb(mi);
%     f=fscore(s_image,500*260,mi,clust_no);
%     fd=fdscore(s_image,500*260,mi,clust_no);
%     q=qscore(s_image,500*260,mi,clust_no);
    %     subplot(1,2,1), imshow(RGB);
    %     title('Segmented Image');
%      load('xuzhou.mat', 'classification_image_cropped');
%         r1=classification_image_cropped;
%         load('indexed.mat');
%         r2=ind;
%     load('PaviaU_gt .mat')
%     r1=paviaU_gt;
%     load('paviad.mat');
%     r2=paviad;
     str=num2str(temp1);
    s1= strcat(str,'ga.tif');
    imwrite(img,s1);
    fid = fopen('Ind_Result.xls','a+');
    fprintf(fid, '\n%f\t%f\t%f\t%f\t%f\t%f\t\n',clust_no,maxf,gtime,f,fd);
    fclose(fid);
    if temp1==1
        
        gc=conv;
        fid1 = fopen('conv.xls','a+');
        fprintf(fid1,'\n%f',conv);
        fclose(fid1);
        str=num2str(temp1);
        %                 s1= strcat(str,'ind4.tif');
        %                 imwrite(RGB,s1);
        seg_image=img;
    else
        if maxf<phic && gc>=gconv
            phic=maxf;
            gc=gconv;
            fid1 = fopen('conv_otsu.xls','a+');
            fprintf(fid1,'\n%f',m);
            fclose(fid1);
            str=num2str(temp1);
            %                     s1= strcat(str,'ind4.tif');
            %                     imwrite(RGB,s1);
            seg_image=img;
        end
        
    end
    
end

imwrite(seg_image,'pav_mepso.tif')
