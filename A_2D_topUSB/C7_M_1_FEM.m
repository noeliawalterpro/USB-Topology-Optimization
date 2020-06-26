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
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
%%  %% METODO %%
METODO=0; %300 puro 400 combinado
F1=0.7;
Met=0;
% Metodo1='M4_1_OT_2D_SBESO_topUSB';
% Metodo2='M2_OT_2D_HOMab_topUSB';
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='C7_M_0_Luo_R';
%nK='K_2D_cortical_esponjoso';

%% Geometria
Scale=1;
A_G_M_Luo
%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL IMPLANTE
nu=0.3;E0=16000;
%nu=0.3;E0=105000;%% IMPLANTE
Emin=E0*1e-9;%% MATERIAL VACIO
%% (OSEO)PROPIEDADES DEL MATERIAL
HU=0;
nuBc=0.3;EBc=13700.; %% CORTICAL
nuBe=0.34;EBe=17600.; %% DIENTE
%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end
xci=round(nely/2);
yci=round(nelx/2);
Eval_pc