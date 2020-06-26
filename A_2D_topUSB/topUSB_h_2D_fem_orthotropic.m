cant=c;

%% CALCULO DE E1 Y E2
%eval(nmicro)
%% CALCULO DE LA MATRIZ DEL MATERIAL DI
E1E2=sqrt(E1*E2);
nu2E1E2=nu*E1E2;
G=(1-nu)*E1E2/2;
Di= 1/(1-nu^2)*[E1 nu2E1E2 0;nu2E1E2 E2 0;0 0 G];
%% MATRIZ DE RIGIDEZ
KA=Ba1'*Di*Ba1+...
    Ba2'*Di*Ba2+...
    Ba3'*Di*Ba3+...
    Ba4'*Di*Ba4;
KA=te*KA;
%% K
eval(nK)
%% RIGIDEZ GLOBAL
 K= sparse(iK,jK,sK);
 K = (K+K')/2;
%% CALCULO DE GRADOS DE DESPLAZAMIENTOS
 U(freedofs) = K(freedofs,freedofs)\F(freedofs);
% 
 AMPLIF=paso/max(max(abs(U(:))))*5;
 for i=1:nodos
    XF(i,1)=XI(i,1)+AMPLIF*U(2*i-1);
    YF(i,1)=YI(i,1)+AMPLIF*U(2*i);
    
end

xf=XF(node);
yf=YF(node);


eval(n_esf_def)