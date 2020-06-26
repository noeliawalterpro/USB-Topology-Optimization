%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=1;rmin=1.5;
ft=2;
maxloop=1000;
PorObj=0.5;
er=0.02;
nmicro='micro_square';
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
%%  %% METODO %%
METODO=0; %100 converg 300 puro 400 combinado
F1=0.7;
Met=0;
 Metodo1='M2_OT_2D_HOMab_topUSB';
% Metodo2='M2_OT_2D_HOMab_topUSB';
%% homogenizacion
vmax=0.8;
vmin=0;
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='C7_M1_0_imp_Luo_R';
%nK='K_2D_cortical_esponjoso_implante';


%% Geometria
Scale=1;
A_G_M_Luo
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end

topUSB_Eval_pc