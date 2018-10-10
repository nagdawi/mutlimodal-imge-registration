function img = seg_hist(img,k)
% Segment the image based on histogram. we can define number ofv color (pin) k we desire in the output image. 
low = min(img(:));
hig = max(img(:));
rang = double(hig-low);
rate = rang/(k-1);
% imshow(img)
img(img<rate) = 0;
for i =1:k-1
    img(img>= rate*i   & img<rate*(i+1)) = rate*i;
%     rate*i
%     rate*(i+1)
end 
% img(img>= rate*2 & img<rate*3) = 28*2;
% img(img>= rate*3 & img<rate*4) = 28*3;
% img(img>= rate*4 & img<rate*5) = 28*4;
% img(img>= rate*5 & img<rate*6) = 28*5;
% img(img>= rate*6 & img<rate*7) = 28*6;
% img(img>= rate*7 & img<rate*8) = 28*7;
% img(img>= rate*8 & img<rate*9) = 28*8;
% imshow(img)
end
% figure
% imshow(img)


