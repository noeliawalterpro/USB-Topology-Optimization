%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=0;
RESULTADOS=0;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M1_0_OT_2D_SIMP_topUSB';
%%%%%%%%%%%%%%%%%%%%%
N=4;
%% 01  % MBB_T
nproblema='P4_M_Lshape2';
fy=-500;
nelx=40*N;nely=40*N;lx=300;
paso=lx/nelx;
ly=nely*paso;
%%%%%%%%%%%%%%%%%%%%%%

%% LOOP PARAMETERS
RMIN=2.750;
rmin=RMIN/paso;
volfrac=0.587;
volmin=0; v=volfrac;
penal=3;ft=2;
tolx=0.001;
maxloop=1000;
%MICRO
vmax=1;vmin=0;
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
HU=0;
nu=0.3;E0=210e3;
nK='K_2D_unimaterial';
Emin=E0*1e-9;
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end


