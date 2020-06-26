 dx = beta*exp(-beta*xTilde)+exp(-beta);
    dc(:) = H*(dc(:).*dx(:)./Hs);
    dv(:) = H*(dv(:).*dx(:)./Hs);