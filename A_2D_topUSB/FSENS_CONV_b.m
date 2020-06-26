 %% FILTERING/MODIFICATION OF SENSITIVITIES 
if ft == 1

Eb = conv2(Eb.*xPhys,jj,'same')./Hs./max(1e-3,xPhys);
elseif ft == 2

Eb = conv2(Eb./Hs,jj,'same');
end

