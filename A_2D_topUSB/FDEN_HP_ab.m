 aTilde(:) = (H*anew(:))./Hs;
      anew = 1-exp(-beta*aTilde)+aTilde*exp(-beta);
      
       bTilde(:) = (H*bnew(:))./Hs;
      bnew = 1-exp(-beta*bTilde)+bTilde*exp(-beta);