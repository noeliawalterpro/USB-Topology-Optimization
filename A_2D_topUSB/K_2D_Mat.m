cant=c;
%% No tiene
% Remodelado oseo
% Modulo de Young del Hueso
Etot_e=zeros(nely,nelx);
KE_e=zeros(64,nmat);

%% Actualizacion de malla
for i=1:nmat
    %     %% NUMERO DE MATERIAL
    kkkk=te*lK(nuMat(i));
    KE_e(:,i) =kkkk(:);
    %% PROPIEDADES ELEMENTALES
    Etot_e(:)=Etot_e(:)+mesh(:,i)*EMat(i);
end
if HU==1 
    %% Calulo de modulo young de todos los elementos
  Etot_e=Etot_e.*(1-mB)+(mB.*DHU.^3*EB);
%Etot_e=Etot_e.*(1-mB)+(mB.*xDICOM.^1.49*EB);
end 
Etot_e=Etot_e.*(1-design)+design.*(EMat(1)+xPhys.^penal.*(Etot_e-EMat(1)));
%% MATRIZ GLOBAL DE RIGIDEZ
sK=0;
for i=1:nmat
    Ee=Etot_e(:).*mesh(:,i);
    %% Calculo de matriz de Rigidez
    sK =sK+ reshape(KE_e(:,i)*Ee(:)',64*nelx,nely,1);
end
