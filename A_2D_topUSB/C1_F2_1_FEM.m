%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
GRAF_ViewDesign=0;
IMAGENES=0;
DEFORMADA=0;
%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=1;rmin=1.5;
ft=2;
maxloop=1000;
PorObj=0.5;
er=0.02;
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
%%  %% METODO %%
METODO=100; %300 puro 400 combinado
F1=0.7;
Met=0;
%%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
nproblema='C1_F2_0_Connor_etal_R';

%% Geometria
Scale=1;
A_G_F_Connor
%%%%%%%%%%%%%%%%%%%%%
if METODO==100 
    ConvergenciaFEM
else
    A_2D_topUSB
end
%

if GRAF_ViewDesign==1
    dd=design*(1- binary_fix);
else
    dd=xPhys.*(1- binary_fix);
end
% %% FACTOR DE SEGURIDAD
% topUSB_h_2D_FS_Mat