function ncc = NCC_fun (img1,img2)
%https://www.researchgate.net/post/How_can_one_calculate_normalized_cross_correlation_between_two_arrays
% mutli = sum(img1.*img2);
% norm_den = sqrt(sum(img1.^2)*sum(img2.^2));
% ncc = mutli/norm_den;
N = numel(img1(:));
mean1 = mean(img1(:));
mean2 = mean(img2(:));
S =  sum((img1(:)-mean1) .* (img2(:) - mean2));
V = sqrt(var(img1(:)) * var(img2(:)) );
ncc = 1/N * (S/V);

end