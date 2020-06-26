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
er=0.02;
nmicro='micro_square';
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
F1=0.7;
Met=0;

Metodo1='M6_0_OT_2D_HOM_m2_topUSB_Mat';

%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='C7_M1_0_imp_Luo_R';
%nK='K_2D_cortical_esponjoso_implante';
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

%% RESTRICCIONES
PorObj=0.3;        % R1
A_R_M1
%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end
topUSB_Eval_pc