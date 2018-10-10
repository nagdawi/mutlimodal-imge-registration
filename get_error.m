function e = get_error(sz,h,v,r,cb_ref)
%calculate root means square error (RMSE) between the ground-truth control points and estimated control points.
%input: sz: floating image size
%       Estimated transformation parameters of the floating image.
%       h: horizontal 
%       v: vertical 
%       r: rotation
%       cb_ref: ground-truth control points. which created manually mostly.
%       Output: RMSE
row = sz(1);
col = sz(2);
T = [1  0                 0;
    0                  1                 0;
    h  v 1];
tform = affine2d(T);
%create 4 mask 
a1 = zeros(row,col);
a2 = zeros(row,col);
a3 = zeros(row,col);
a4 = zeros(row,col);
%set one control point (cp) for each mask
a1(floor(row/5),floor(col/5)) = 1;
a2(floor(row/5),floor(col/5*4)) = 1;
a3(floor(row/5*4),floor(col/5)) = 1;
a4(floor(row/5*4),floor(col/5*4)) = 1;
%Apply transformation same as ourput floating image.
b1 = imrotate(a1,r);
b1 = imwarp(b1,tform,'OutputView', cb_ref);
b2 = imrotate(a2,r);
b2 = imwarp(b2,tform,'OutputView', cb_ref);
b3 = imrotate(a3,r);
b3 = imwarp(b3,tform,'OutputView', cb_ref);
b4 = imrotate(a4,r);
b4 = imwarp(b4,tform,'OutputView', cb_ref);
%calculte the error matrix
err1 = bwdist(b1);
err2 = bwdist(b2);
err3 = bwdist(b3);
err4 = bwdist(b4);
%
cp(1)= err1(floor(row/5),floor(col/5));
cp(2) = err2(floor(row/5),floor(col/5*4));
cp(3) = err3(floor(row/5*4),floor(col/5));
cp(4) = err4(floor(row/5*4),floor(col/5*4));
e=0;
for i = 1:4
%     if cp(i) == inf
%         cp(i) = 360;%max poissble distance
%     end
    e= e+cp(i)^2;
end
% e(e==inf) = null(1);
%get cp error value
%we should solve inf distance value
e = sqrt(e/4);


end
