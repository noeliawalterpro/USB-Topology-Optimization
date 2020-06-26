disp('topUSB_2D_xini')
%% Inicialiciacion de densidad artificial
eval(nxPhys)
xini=xPhys;
xPhysA=design.*(xPhys);
xPhysAi=xPhysA;
NxPhysA=sum(xPhysA(:));
mxPhysA=sum(sum(xPhysA))/neA;
xnew=xPhysA;
%% GRAFICA DE ESTRUCTURA INICIAL
topUSB_estructura


title({ regexprep(nmetodo,'_',' '),'Estructura inicial'})