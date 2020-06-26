%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%%%%%%%%%%%%%%%%%%%%
nmicro='micro_square';
%% RESTRICCIONES
PorObj=0.5;     % R1
Poromax=500e-3; % R2[mm]
Poromin=200e-3; % R3[mm]
Pconmin=300e-3; % R4[mm]
Strutmin=200e-3;% R5[mm]
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
nproblema='C2_F1_0_wieding_etal_R';
%nK='K_2D_cortical_esponjoso_implante';

%% Geometria
Scale=1;
A_G_F_wiedign
%%%

%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.7; volmin=0; v=volfrac;
%% PROBLEMA
%%  %% METODO %%
METODO=400; %300 puro 400 combinado
F1=0;
Met=0;
%% METODO 1
Metodo1='M4_1_OT_2D_SBESO_Mat_topUSB';
% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
penal1=3;tolx1=1;rmin1=1.5;
ft1=2;
maxloop1=1000;
er1=0.02;
%% METODO 2
Metodo2='M2_0_OT_2D_HOM_Mat_topUSB';
% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
penal2=3;tolx2=1;rmin2=1.5;
ft2=2;
maxloop2=1000;
er2=0.02;
%%%
%%%%%%%%%%%%%%%%%%%%%
%HOMOGENIZACION
vmin=0;
vmax=0.8;
%% PROPIEDADES DEL MATERIAL
nu=0.3;
E0=90e3;
Emin=16e3*1e-9;%% MATERIAL VACIO
%% (OSEO)PROPIEDADES DEL MATERIAL
HU=0;
%% CORTICAL
nuBc=0.3;
EBc=16.0e3;%[MPa]
%% ESPONJOSO
nuBe=0.3;
EBe=2.0e3;%[MPa]
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end
axis equal