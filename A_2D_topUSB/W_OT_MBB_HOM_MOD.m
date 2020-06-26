
%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;
RESULTADOS=0;
%% LOOP PARAMETERS
HU=0;
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=0.1;rmin=1.5;
maxloop=1000;
PorObj=0.587;
ft=2;
%% HOMOGENIZACION
vmin=0;
vmax=1;
nmicro='micro_square';
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
F1=0.5;
Met=0;
Metodo1='M2_2_OT_2D_HOMab_MOD_topUSB';
Metodo2='';

%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
N=1;
A_HMBB_1

nK='K_2D_unimaterial';
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;    ConvergenciaFEM,else    A_2D_topUSB,end

