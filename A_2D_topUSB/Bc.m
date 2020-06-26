
function Bc=Bc(eta,zeda,detJ,J22,J12,J21,J11)

n1x=J22*(-1)*(1-eta)-J12*(-1)*(1-zeda);
n1y=-J21*(-1)*(1-eta)+J11*(-1)*(1-zeda);

n2x=J22*(1)*(1-eta)-J12*(-1)*(1+zeda);
n2y=-J21*(1)*(1-eta)+J11*(-1)*(1+zeda);

n3x=J22*(1)*(1+eta)-J12*(1)*(1+zeda);
n3y=-J21*(1)*(1+eta)+J11*(1)*(1+zeda);

n4x=J22*(-1)*(1+eta)-J12*(1)*(1-zeda);
n4y=-J21*(-1)*(1+eta)+J11*(1)*(1-zeda);

Bc=[ n1x    0   n2x   0    n3x   0   n4x    0;
      0    n1y   0   n2y    0   n3y   0    n4y;
     n1y   n1x  n2y  n2x   n3y  n3x  n4y   n4x];
 detJ=2*detJ;
 Bc=0.25*Bc/detJ;

end