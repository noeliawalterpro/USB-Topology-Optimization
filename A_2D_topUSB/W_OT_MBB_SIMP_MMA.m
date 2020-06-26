%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;
RESULTADOS=0;
%% LOOP PARAMETERS
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=0.1;rmin=1.3;ft=2;
maxloop=1000;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M1_2_OT_2D_SIMP_MMA_topUSB';
PREF='F_f'; %% F_f F_CONV  F_PDE
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='P1_M_HALF_MBB';
fy=-500;N=1;
nelx=96*N;nely=40*N;lx=360.294;
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

