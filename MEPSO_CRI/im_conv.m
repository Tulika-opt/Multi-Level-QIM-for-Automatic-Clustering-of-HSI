
% YourData = seg_image;
% % filename = 'ind14.tiff';
% % imwrite( ind2rgb(im2uint8(mat2gray(YourData)), jet(256)), filename)
% m=ind2rgb(im2uint8(mat2gray(YourData)), jet(256));
% imshow(m)
 imwrite(seg_image,'pav_edwpso.tif')