%% CONFIGURACION
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=0;
RESULTADOS=0;

%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
F1=1;
Met=0;
Metodo1='M4_1_OT_2D_SBESO_topUSB';
Metodo2='';
%%%%%%%%%%%%%%%%%%%%%
N=2;

%% 01  % MBB_T
nproblema='P3_M_Cantilever2';
A_HMBB_1

%% LOOP PARAMETERS
RMIN=5.6296;
rmin=RMIN/paso;
%rmin=1.5;
%% LOOP PARAMETERS
volfrac=0.587; volmin=0; v=volfrac;
penal=3;ft=0;
tolx=0.001;
er=0.02;
maxloop=1000;
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;
nK='K_2D_unimaterial';
HU=0;
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100; ConvergenciaFEM,else A_2D_topUSB, end
