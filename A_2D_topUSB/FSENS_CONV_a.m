 %% FILTERING/MODIFICATION OF SENSITIVITIES 
if ft == 1

Ea = conv2(Ea.*xPhys,jj,'same')./Hs./max(1e-3,xPhys);
elseif ft == 2

Ea = conv2(Ea./Hs,jj,'same');
end

