%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
eval('topUSB_config_Mat')
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;
RESULTADOS=0;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M1_0_OT_2D_SIMP_topUSB_Mat';
%%%%%%%%%%%%%%%%%%%%%

%% 01  % MBB_T
nproblema='P33_BIG_MBB';
fy=-500;N=1;
Scale=N;
%nelx=192*N;nely=81*N;lx= 559.5900;
nelx=300*N;nely=300*N;lx= 559.5900;
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;
Sy0=1;
te=1; %espesor del elemento

paso=lx/nelx;
%% LOOP PARAMETERS
RMIN=2.0642;
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
Emin=E0*1e-9;
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end


