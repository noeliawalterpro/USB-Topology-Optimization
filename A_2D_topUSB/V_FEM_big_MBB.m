%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
eval('topUSB_config_Mat')
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1; 
RESULTADOS=1;
DEFORMADA=0;
%% LOOP PARAMETERS
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=1;rmin=1.5;
F1=0.5;ft=2;
maxloop=1000;
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=0; %300 puro 400 combinado
Met=0;
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='P33_BIG_MBB';
fy=-500;N=1;
Scale=N;
nelx=300*N;nely=300*N;lx= 559.5900;
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;
Sy0=1;
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end
