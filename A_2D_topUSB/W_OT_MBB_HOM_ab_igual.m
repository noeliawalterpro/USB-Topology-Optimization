%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
RESULTADOS=1;
DEFORMADA=1;

flagImagesc=0;     % 1 para graficar con la funcion imagesc CON TODOS ELEMENTOS
%% LOOP PARAMETERS
HU=0;
volfrac=0.95; volmin=0; v=volfrac;
penal=3;tolx=1;rmin=1.5;
maxloop=1;
PorObj=volfrac;
F1=0.5;ft=2;
%% HOMOGENIZACION
vmin=0;
vmax=1;
nmicro='micro_square';

a=sqrt(0.6);
b=a;
amin=a;
bmin=a;
amax=a;
bmax=a;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M2_1_OT_2D_HOM_ab_topUSB';
Metodo2='';
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='P1_M_HALF_MBB';
fy=-500;N=1/4;
nelx=96*N;nely=40*N;
lx=360.294;
penal=1;
%% 
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL 
nu=0.3;E0=200e3;
Emin=E0*1e-9;
nK='K_2D_unimaterial';
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
  ConvergenciaFEM
else
  A_2D_topUSB
end
format short
xci=round(1);
yci=round(1);
topUSB_h_Eval_pc
xci=round(nely);
yci=round(1);
topUSB_h_Eval_pc
xci=round(nely/2)+1;
yci=round(nelx);
topUSB_h_Eval_pc
xci=round(1);
yci=round(nelx/2);
topUSB_h_Eval_pc
xci=round(nely);
yci=round(nelx/2);
topUSB_h_Eval_pc
xci=round(nely/2);
yci=round(nelx/2);
topUSB_h_Eval_pc
xci=round(nely/2);
yci=round(1);
topUSB_h_Eval_pc
xci=round(1);
yci=round(nelx);
topUSB_h_Eval_pc
xci=round(nely);
yci=round(nelx);
topUSB_h_Eval_pc