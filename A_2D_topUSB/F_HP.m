%% PREPARE FILTER  (Line 23 to 44 )
iH = ones(nelx*nely*(2*(ceil(rmin)-1)+1)^2,1);
jH = ones(size(iH));
sH = zeros(size(iH));
k = 0;
for i1 = 1:nelx
    for j1 = 1:nely
        el = (i1-1)*nely+j1;
        for i2 = max(i1-(ceil(rmin)-1),1):min(i1+( ceil(rmin)-1),nelx)
            for j2 = max(j1-(ceil(rmin)-1),1):min(j1+( ceil(rmin)-1),nely)
                e2 = (i2-1)*nely+j2;
                k = k+1;
                
                iH(k) = el;
                jH(k) = e2;
                sH(k) = max(0,rmin-sqrt((i1-i2)^2+(j1-j2)^2));
            end
        end
    end
end
H = sparse(iH,jH,sH);
Hs = sum(H,2);

beta = 1;

  xTilde = xPhys;
  xnew = 1-exp(-beta*xTilde)+xTilde*exp(-beta);
  
SENS='FSENS_HP';
SENSab='FSENS_HP_ab';
SENSb='FSENS_HP_b';
DEN='FDEN_HP';
DENab='FDEN_HP_ab';
DENb='FDEN_HP_b';