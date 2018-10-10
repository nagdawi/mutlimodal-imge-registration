function img_out = imTrans(img,h,v,r)
%transform image with horizantal, vertical and rotation para.
% h =col
%v =row
cb_ref = imref2d(size(img));
try
    T = [1   0        0;
    0    1        0;
    h    v        1];
catch
    T
end
tform = affine2d(T);
img_out = imwarp(img,tform,'OutputView', cb_ref);
%rotate floating image
%     flt2 = imrotate(flt2,r,'crop');
end