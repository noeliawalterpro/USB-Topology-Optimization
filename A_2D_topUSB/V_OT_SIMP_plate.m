%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;
RESULTADOS=0;
DEFORMADA=0;
%% LOOP PARAMETERS
volfrac=0.7; volmin=0; v=volfrac;
penal=3;tolx=0.001;rmin=1.3;ft=2;
maxloop=1000;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M88_1_RO_topUSB';
vmax=1.74;
vmin=0.001;

%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='P27_M_RO';
fy=-10;N=1;
nelx=50*N;nely=50*N;lx=1;
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
HU=0;
nu=0.3;E0=100;
nK='K_2D_unimaterial';

Emin=E0*1e-9;
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end

