function [sband,ig]=band_selection(high_ig)
  i=1;
   band=0;
   band_id=0;
   j=1;

   [pmax1,idx1]=max(high_ig(1:145));
   band(i)=pmax1;
   band_id(i)=idx1;
   i=i+1;
   
   [pmax2,idx2]=max(high_ig(146:230));
   band(i)=pmax2;
   band_id(i)=idx2+145;
   i=i+1;
   

   [pmax3,idx3]=max(high_ig(231:313));
   band(i)=pmax3;
   band_id(i)=idx3+230;
   i=i+1;
   
   
   [pmax4,idx4]=max(high_ig(314:436));
   band(i)=pmax4;
   band_id(i)=idx4+313;
   i=i+1;
  
%     [pmax5,idx5]=max(high_ig(231:309));
%    band(i)=pmax5;
%    band_id(i)=idx4+230;
%    i=i+1;   
%    
%     [pmax6,idx6]=max(high_ig(310:343));
%    band(i)=pmax6;
%    band_id(i)=idx4+309;
%    i=i+1;
%    
%     [pmax7,idx7]=max(high_ig(344:436));
%    band(i)=pmax7;
%    band_id(i)=idx4+343;
%    i=i+1;
   sband=band_id;
   ig=band;
   
   
end 