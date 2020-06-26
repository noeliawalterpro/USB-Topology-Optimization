 %% FILTERING/MODIFICATION OF SENSITIVITIES 
if ft == 1
dc = conv2(dc.*xPhys,jj,'same')./Hs./max(1e-3,xPhys);
elseif ft == 2
dc = conv2(dc./Hs,jj,'same');
dv = conv2(dv./Hs,jj,'same');
end