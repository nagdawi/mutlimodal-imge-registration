function ety = joint_entropy (fix, float)
  histogram = jointHist(fix, float);
%histogram = joint_histogram(fix, float);
 j_bins_index = histogram ~=0; %non-zero color (index) to find real color 
                     % use in image for entropy
 j_bins = histogram(j_bins_index);
 j_prob = j_bins / numel(fix);%numel same for fix and floating images
 ety = -sum(j_prob.*log2(j_prob));
 
end