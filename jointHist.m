function jh = jointHist(img1,img2)
if ~(isinteger(img1) && isinteger(img2))
    error('image should be integer');
end
if ~isequal(size(img1),size(img2))
    error(['images should be same size',num2str(size(img1)),' not equal ',num2str(size(img2))]);
end
max_img1 = max(max(img1(:)));
max_img2 = max(max(img2(:)));
max_img = max(max_img1,max_img2);

% jh = zeros(max_img+2,max_img+2);
 jh = zeros(256,256);
for i=1:length(img1(:,1))
    for j = 1:length(img1(1,:))%2 imgs same size.
        intensity1 = img1(i,j) + 1;%offset matrix by 1 because index start by 1
        intensity2 = img2(i,j) + 1;
%         intensity1 = ceil(intensity1);
%         intensity2 = ceil(intensity2);
        jh(intensity1, intensity2) =  jh(intensity1,intensity2) + 1;
    end
end
% imshow(mat2gray(jh));
% pause(1/100);
end
