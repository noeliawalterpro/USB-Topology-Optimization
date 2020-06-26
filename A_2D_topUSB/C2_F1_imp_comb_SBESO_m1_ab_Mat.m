%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
displayflag=1;
%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.5;
volmin=0;
%% PROBLEMA
nproblema='C2_F1_0_wieding_etal_R';
%% Geometria
Scale=2;
A_G_F_wieding
%%  %% METODO %%
METODO=400; %300 puro 400 combinado
F1=0;Met=0;
%% METODO 1
Metodo1='M4_1_OT_2D_SBESO_topUSB_Mat';
% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
penal1=3;tolx1=0.01;rmin1=4;
ft1=2;
maxloop1=1000;
er1=0.02;
%% METODO 2
Metodo2='M5_1_OT_2D_HOM_m1_ab_topUSB_Mat';
nmicro='micro2';
penal2=3; tolx2=0.01; rmin2=3/paso;
ft2=2;
maxloop2=1000;
er2=0.02;
%% RESTRICCIONES
PorObj=0.6;        % R1
A_R_M1

if xPormin>PorObj    ||xPormax<PorObj
    disp('/////////parametros entrada////////////////')
    fprintf('Porosidad   Pmin.:%0.3e PorObj.:%0.3e\n',...
        xPhysmin,PorObj);
    fprintf('Porosidad   Pmax.:%0.3e PorObj.:%0.3e\n',...
        xPhysmax,PorObj);
else
    if METODO==100; ConvergenciaFEM, else  A_2D_topUSB,end    
end

topUSB_h_2D_FS_Mat
% a =    0.2306
% b =    0.0349