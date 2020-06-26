
%% CONFIGURACION
topUSB_config
%% LOOP PARAMETERS
penal=3;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
METODO=100;Met=0;
%% 13 % 3 PUNTOS DE FLEXION
nproblema='P13_M_3PointBending';
fy=-1000;
N=4;
nelx=10*N;
nely=1*N;
lx=10;ft=2;
%%%%%%%%%%%%%%%%%%%%%%
%% Materiales
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=200E9;
Emin=E0*1e-9;
nK='K_2D_unimaterial';

te=1; %espesor del elemento
%% %%%%%%%%%%%%%%%%%%%
maxloop=1;
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end
%%%%%%%%%
paso=lx/nelx;
x=0:paso:paso*nelx;
E=E0;
P=abs(fy);
L=nelx*paso;

h=nely*paso;
b=1;
I=b^3*h/12;

L=lx;
v=P/(48*E*I)*(4*x.^3-3*L^2*x-8*(x-L/2).^3);
desp=P*L^3/(48*E*I)
% uy(round(nely*nelx/2)-nely)
minu=min(U)
minuy=min(uy(:));

error=(abs(desp)-abs(minu))/abs(desp)*100
mean(esfv(:))

