%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;
RESULTADOS=0;


%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M2_0_OT_2D_HOM_topUSB';
%%%%%%%%%%%%%%%%%%%%%
N=2;
%% 01  % MBB_T
nproblema='P3_M_Cantilever2';
A_HMBB_1
RMIN=2.0642;
rmin=RMIN/paso;
rmin=3;
%% HOMOGENIZACION
vmin=0;
vmax=1;
nmicro='micro_square';
%% LOOP PARAMETERS
HU=0;
 volfrac=0.587;
PorObj=1-volfrac;
volmin=0; v=volfrac;
penal=3;
tolx=0.01;
maxloop=1000;
ft=2;
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

