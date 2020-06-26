 %% FILTERING/MODIFICATION OF SENSITIVITIES 
if ft == 1
dc(:) = (TF'*(LF'\(LF\(TF*(dc(:).*xPhys(:)))))) ...
./max(1e-3,xPhys(:));
elseif ft == 2
dc(:) = TF'*(LF'\(LF\(TF*dc(:))));
dv(:) = TF'*(LF'\(LF\(TF*dv(:))));
end