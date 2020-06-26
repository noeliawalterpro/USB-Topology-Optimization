%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
DEFORMADA=1;
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
nproblema='C2_F1_0_wieding_etal_R';
penal=3;maxloop=1;
%% Geometria
Scale=1;
A_G_F_wieding

%% METODO %%
METODO=100;%300 puro 400 combinado
F1=0;Met=0;

if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end


