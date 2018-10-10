function MI = MutualInfo(cfix,cfloat,totalFloatPixel,constrainRatio)
%this function calcalate kmean cluster to reduce the process time
%and normailze the multimodal image. Plut, calc entory for fix,
%float and joint with apply transformation for -100 to 100 (LTR).
%reture the matual information between the 2 images.



% estimate the joint histogram of the overlap region according to the transformation parameters
% jHistogram = jointHist(cfix,cfloat);
% total pixels of the overlap reion
% overlapPixel = sum(jHistogram(:));
overlapPixel = numel(cfix);
% overlap region of two images
overlapRatio = single(overlapPixel)/single(totalFloatPixel);
if overlapRatio < constrainRatio
    MI = 0;
else
    fx_ety = entropy(cfix);
    %Calc new entropy
    fl_ety = entropy(cfloat);
    j_ety = joint_entropy(cfix, cfloat);
    MI = fx_ety + fl_ety - j_ety;
    %    MI = (fx_ety + fl_ety) / j_ety;% normalize MI
end

end