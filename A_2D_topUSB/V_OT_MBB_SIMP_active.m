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
Metodo1='M1_0_OT_2D_SIMP_topUSB';
PREF='F_CONV'; %% F_f F_CONV  F_PDE
%%%%%%%%%%%%%%%%%%%%%
N=1;
A_HMBB_1
nproblema='P28_M_HALF_MBB_active';
paso=lx/nelx;
RMIN=6;
rmin=RMIN/paso;
%% LOOP PARAMETERS
vmin=0;
vmax=1;
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=0.1;ft=2;
maxloop=1000;
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
box off 
axis off
