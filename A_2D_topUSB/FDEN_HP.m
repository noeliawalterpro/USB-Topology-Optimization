 xTilde(:) = (H*xnew(:))./Hs;
      xnew = 1-exp(-beta*xTilde)+xTilde*exp(-beta);