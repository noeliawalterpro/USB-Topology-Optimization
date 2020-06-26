%% MODIFICABLE  % 1 ACTIVO 0 INACTIVO
topUSB_config
IMAGENES=0;     % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;
RESULTADOS=0;
%% LOOP PARAMETERS
HU=0;
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=0.1;rmin=1.5;
maxloop=1000;
ft=2;
nmicro='micro2';
%% PROBLEMA
%%%%%%%%%%%%%%%%%%%%
%%  %% METODO %%
METODO=300; %300 puro 400 combinado
Metodo1='M5_2_OT_2D_HOM_m1_b_topUSB';
%%%%%%%%%%%%%%%%%%%%%
%% 01  % MBB_T
nproblema='P1_M_HALF_MBB';
fy=-500;N=2;
nelx=96*N;nely=40*N;lx=360.294;
%%
paso=lx/nelx;
%% RESTRICCIONES
PorObj=volfrac;        % R1
Poromax  = 500e-3; % R2[mm]
Poromin  = 200e-3; % R3[mm]
Pconmin  = 300e-3; % R4[mm]
Strutmin = 200e-3; % R5[mm]
%% HOMOGENIZACION
%% [b] Poro
bmin=0%[mm]
bmax=(Poromax-Pconmin*sqrt(2))/paso%[mm]
%% [a] Poro conectivo
amax=Poromax/paso%[mm]
amin=Pconmin/paso%[mm]
%%
xPhysmin=(1-2*amax-pi*bmin.^2)
xPhysmax=(1-2*amin-pi*bmax.^2)
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;
nK='K_2D_unimaterial';
te=1; %espesor del elemento
%%%%%%%%%%%%%%%%%%%%%%



if xPhysmin>PorObj    || xPhysmax<PorObj
    disp('/////////parametros entrada////////////////')
    fprintf('Porosidad   Pmin.:%0.3e PorObj.:%0.3e\n',...
        xPhysmin,PorObj);
    fprintf('Porosidad   Pmax.:%0.3e PorObj.:%0.3e\n',...
        xPhysmax,PorObj);
    
    
else
    if METODO==100;
        ConvergenciaFEM
    else
        A_2D_topUSB
    end
    
end


