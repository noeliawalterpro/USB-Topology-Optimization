%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
DEFORMADA=1;
%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.8; volmin=0; v=volfrac;
penal=3;maxloop=1;
%% PROBLEMA
%%  %% METODO %%
METODO=0; %300 puro 400 combinado
F1=0;Met=0;
%%%%%%%%%%%%%%%%
%% PROBLEMA
nproblema='C1_F_0_Connor_etal_R';
%% Geometria
Scale=2;
A_G_F_Connor
%%

%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end


