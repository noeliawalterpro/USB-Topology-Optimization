%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=0; 
RESULTADOS=0;
%% LOOP PARAMETERS
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=1;rmin=3;
F1=0.5;ft=2;
maxloop=1000;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=88; %300 puro 400 combinado
Metodo1='M88_RO_topUSB';
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='P27_M_RO';
fy=-10; %%[N/mm]
N=10;
HU=0;
nelx=5*N;nely=5*N;lx=1;
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=100;
Emin=E0*1e-4;
nK='K_2D_unimaterial';
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end

