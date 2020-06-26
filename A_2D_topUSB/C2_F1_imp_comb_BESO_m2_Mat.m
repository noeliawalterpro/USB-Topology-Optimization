%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.5; 
volmin=0; 
%% PROBLEMA
nproblema='C2_F1_0_wieding_etal_R';
%nK='K_2D_cortical_esponjoso_implante';
%% Geometria
Scale=2;
A_G_F_wieding

%%  %% METODO %% 
METODO=400; %300 puro 400 combinado
F1=0;Met=0;
%% METODO 1
Metodo1='M4_0_OT_2D_BESO_topUSB_Mat';
% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
penal1=3;tolx1=0.01;rmin1=1.5;
ft1=2;
maxloop1=1000;
er1=0.02;
%% METODO 2
Metodo2='M6_0_OT_2D_HOM_m2_topUSB_Mat';
nmicro='micro2';
penal2=3; tolx2=0.001; rmin2=3/paso;
ft2=2;
maxloop2=1000;
er2=0.02;
%% RESTRICCIONES
PorObj=0.6;        % R1
A_R_M2


    if METODO==100;
        ConvergenciaFEM
    else
        A_2D_topUSB
    end
    


SyBc=108;
SyBe=108;
Sypt=1100;
Sy0=35.9;

%% FACTOR DE SEGURIDAD
SyBc_e=mBc.*SyBc;
SyBe_e=mBe.*SyBe;
Sypt_e=mpt.*Sypt;
Sy0_e=design.*Sy0;
Sy_e=Sy0_e+SyBc_e+SyBe_e+Sypt_e;
FS=zeros(nely,nelx);
dd=xPhysA;
FS(dd>0)=(Sy_e(dd>0)./esfv(dd>0));
  set(0,'DefaultFigureWindowStyle','docked')

fname='FS';cc=FS;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
axis equal
