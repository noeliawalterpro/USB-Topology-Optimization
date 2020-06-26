%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=0;
RESULTADOS=0;
nfem='topUSB_2D_fem_orthotropic';
%% LOOP PARAMETERS
HU=0;
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=0.01;rmin=1.5;
maxloop=1;
PorObj=0.587;
ft=2;
%% HOMOGENIZACION
vmin=0;
vmax=1;
nmicro='micro_square';
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Met=0;
Metodo1='M2_OT_2D_HOM_ab_topUSB';
%% 01  % MBB_T
nproblema='P1_M_HALF_MBB';
fy=-500;N=1;
nelx=24*N;nely=10*N;lx=360.294;
%a=0.7071; b=0.7071;
paso=lx/nelx;
porosidad=0.7
a=sqrt(1-porosidad)
b=a
xPhys=(1-a*b)
ai=a*paso
bi=b*paso

%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;
E1=E0*(1-b)^penal;
E2=E0*(1-a)^penal;
nK='K_2D_uni_ortho';
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end

min(uy(:))

fprintf('TOTAL   esf 1.:%7.3f centro.:%7.3f cabajo.:%7.3f\n',...
    esfv(round(nely),(nelx/4)),...
    esfv(round(nely/2),(nelx/2)),...
    esfv(round(nely),(nelx/2)));
