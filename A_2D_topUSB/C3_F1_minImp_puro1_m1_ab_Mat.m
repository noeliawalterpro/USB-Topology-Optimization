%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%% PROBLEMA
nproblema='C3_F1_0_minImp_wieding_etal_R';
%nK='K_2D_cortical_esponjoso_implante';
%% Geometria
Scale=2;
A_G_F_wieding
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
F1=0;
Met=0;
Metodo1='M5_1_OT_2D_HOM_m1_ab_topUSB_Mat'; 
mtol=0.005;
toli=1e-15;
%%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.6; volmin=0; v=volfrac;
penal=3;tolx=0.01;
rmin=3/paso;
ft=2;
maxloop=1000;
nmicro='micro2';
%% RESTRICCIONES
PorObj=0.6;        % R1
A_R_M1

if METODO==100;ConvergenciaFEM;else A_2D_topUSB,end


