%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1; 
RESULTADOS=0;
DEFORMADA=1;
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
nproblema='P1_M_HALF_MBB';
fy=-500;N=0.5;
nelx=24*N;nely=10*N;lx=360.294;

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
mean(esfv(:))
min(uy(:))
fprintf('TOTAL   esf 1.:%7.3f centro.:%7.3f cabajo.:%7.3f\n',...
    esfv(round(nely),(nelx/4)),...
    esfv(round(nely/2),(nelx/2)),...
    esfv(round(nely),(nelx/2)));