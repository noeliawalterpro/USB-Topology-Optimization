%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%%%%%%%%%%%%%%%%%%%%
%% Geometria
Scale=1;
A_G_F_wieding
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=0.001;rmin=3;
ft=2;
maxloop=1000;
nmicro='micro_square';
%% RESTRICCIONES
PorObj=0.587;     % R1

%% PROBLEMA
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
F1=0;
Met=0;
Metodo1='M2_0_OT_2D_HOM_topUSB_Mat';
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='C3_F1_0_minImp_wieding_etal_R';
%%%%%%%%%%%%%%%%%%%%%
%% HOMOGENIZACION
vmin=0;
vmax=1;

%%%%%%%%%%%%%%%%%%%%%%
if METODO==100; ConvergenciaFEM, else  A_2D_topUSB,end