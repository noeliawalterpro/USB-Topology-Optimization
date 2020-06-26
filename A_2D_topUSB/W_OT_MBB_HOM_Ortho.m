%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;
RESULTADOS=0;
%% LOOP PARAMETERS
HU=0;
volfrac=0.587; volmin=0; v=volfrac;
penal=5;tolx=0.01;rmin=1.3;
maxloop=1000;
PorObj=0.587;
ft=2;
%% HOMOGENIZACION
vmin=0;
vmax=1;
nmicro='micro_square';
nfem='topUSB_2D_fem_orthotropic';
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M2_1_OT_2D_HOM_ab_topUSB';
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='P1_M_HALF_MBB';
fy=-500;N=1;
nelx=2*96*N;nely=40*N;lx=2*360.294;
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

