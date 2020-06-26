%% Matriz de Rigidez
K_isotrop_topUSB
% %% Modulo de Young del material del andamio
% Ee=(1-mB-design)*Emin;%%+EBc_e+EBe_e;
% if loopt>1 && METODO==88
%     Ee=Erem;
% end
% %% Calculo de matriz de Rigidez del andamio
% sK = reshape(KE(:)*Ee(:)',64*nelx,nely,1);
% Etot_e=Ee;
% %

% %% Modulo de Young del Hueso
% if HU==1
%     % Conversion a Hounfield
%     x1=max(m2(:));
%     x2=min(m2(:));
%     a1=(HUmin-HUmax)/(x2-x1);
%     b2=HUmin-a1*x2;
%     m2=(m2)*a1+b2;
%     BHU=m2;
%     % Conversion a densidad
%     a1=(dmin-dmax)/(HUmin-HUmax);
%     b2=dmin-a1*HUmin;
%     DEB=(BHU)*a1+b2;
%     %% Calulo de modulo young de todos los elementos
%     mEB=m1.*dEB.^3*EB+(1-m1+design)*Emin;
% else
%     %% Calulo de modulo young de todos los elementos
%     mEB=m1.*EB+(1-m1+design)*Emin;
% end
%% Lineas para el metodo de remodelado oseo

mEB=Erem;
Etot_e=mEB;

KEB =  te*lK(nu);
%% Calculo de matriz de Rigidez del hueso )
sK = reshape(KEB(:)*mEB(:)',64*nelx,nely,1);

