%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1; 
RESULTADOS=0;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Metodo1='M4_0_OT_2D_BESO_topUSB';
%%%%%%%%%%%%%%%%%%%%%
N=4;
%% 01  % MBB_T
nproblema='P4_M_Lshape2';
fy=-500;
nelx=40*N;nely=40*N;lx=300;
paso=lx/nelx;
ly=nely*paso;
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;
%% LOOP PARAMETERS
RMIN=5.6296;
rmin=RMIN/paso;
volfrac=0.587; 
volmin=0; v=volfrac;
penal=3;
tolx=0.01;
F1=1;ft=2;
maxloop=1000;
%% BESO
ERR=0.02;
IRR=0.02;
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;
nK='K_2D_unimaterial';
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end


% ////////////////////////////////
% /////////TIEMPOS////////////////
% METODO   tM.: 32.481 tcpuM.: 37.971
% PRE PROC tB.:  0.291 tcpuB.:  0.265
% TOTAL    tT.: 32.773 tcpuT.: 38.236
% topUSB_estructura