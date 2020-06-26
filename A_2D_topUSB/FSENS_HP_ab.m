 dx = beta*exp(-beta*xTilde)+exp(-beta);
    Ea(:) = H*(Ea(:).*dx(:)./Hs);
    Eb(:) = H*(Eb(:).*dx(:)./Hs);