
%% estado plano de deformaciones
% Di= 1/((1+nu)*(1-2*nu))*[1-nu     nu    0    ; v    1-nu    0 ;0   0   (1-nu)/2];
if edo_pdef==1
    nu=(nu/(1-nu));
    nuB=(nuB/(1-nuB));
    a=(1-nu)/(1+nu);
    EB=EB*a;
    
    Emin=Emin*a;
    a=(1-nuB)/(1+nuB);
    E0=E0*a;
end
%% estado plano esfuerzos
Di=lDi(nu(1));
KE  =  te*lK(nu);
