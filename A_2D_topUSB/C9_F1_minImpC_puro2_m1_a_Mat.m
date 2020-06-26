%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%% PROBLEMA
nproblema='C9_1_F1_0_minImpC_wieding_etal_R';
%nK='K_2D_cortical_esponjoso_implante';
%% Geometria

Scale=2;
A_G_F_wieding

%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
F1=0;
Met=0;
Metodo1='M5_2_OT_2D_HOM_m1_a2_topUSB_Mat'; %A Y B CONSTANTES
%%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.5; volmin=0; v=volfrac;
rmin=1.5;
penal=3;tolx=0.01;
ft=2;
maxloop=1000;
nmicro='micro2';

%% RESTRICCIONES
PorObj=0.6;        % R1
A_R_M1
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end
