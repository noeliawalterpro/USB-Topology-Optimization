%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.4845; volmin=0; v=volfrac;
penal=3;tolx=1;rmin=1.5;
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
%%  %% METODO %%
METODO=100; %300 puro 400 combinado
F1=0;
Met=0;
Metodo1='M2_OT_2D_HOM_Mat_topUSB';
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='C9_1_F1_0_minImpC_wieding_etal_R';
%% Geometria
Scale=1;
A_G_F_wieding
%% %%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end