clear all
close all
%%%%%%%%%%%%%%%%%%%
tStart = tic;
tStartB = tic;
nmetodo='';
nK='';
%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
%% LOOP PARAMETERS
penal=3;

%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
METODO=0;Met=0;
%% 13 % 3 PUNTOS DE FLEXION
nproblema='P22_M_Placa';
fx=-1000;
N=1;nelx=100*N;nely=50*N;lx=1;ft=2;
%%%%%%%%%%%%%%%%%%%%%%
%% Materiales
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=200E9;
Emin=E0*1e-9;
nK='K_2D_unimaterial';
te=1; %espesor del elemento
%% (OSEO)PROPIEDADES DEL MATERIAL
HU=0;
nuBc=0.3;EBc=1; %% CORTICAL
nuBe=0.3;EBe=1; %% ESPONJOSO
%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end

aa=nely*paso/2;
tita=0;
T=fx;
% r=aa:paso:paso*nelx;
r=nelx/4*paso;
sigmax=T-T*aa^2./r.^2*(3/2*cos(2*tita))+T*(3/2*aa^4./r.^4)*cos(4*tita);
esfx(nely,:)
sigmay=-T*aa^2./r.^2*(1/2*cos(2*tita)-cos(4*tita))-T*3/2*aa^4./r.^4*cos(4*tita);
esfy(nely,:)
taoxy=-T*aa^2./r.^2*(1/2*sin(2*tita)+sin(4*tita))+T*3/4*aa^4./r.^4*sin(4*tita);
txy(nely,:)

