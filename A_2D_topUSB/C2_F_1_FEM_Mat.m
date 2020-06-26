%%%%%%%%%%%%%%%%%%%%
%% CONFIGURACION
topUSB_config
eval('topUSB_config_Mat')
RESULTADOS=0;
nproblema='C2_F_0_wieding_etal_R';
%nK='K_2D_cortical_esponjoso';
%%%%%%%%%%%%%%%%%%%%%
%% Geomchetria
Scale=1;
A_G_F_wieding
%%
RMIN=12;
rmin=RMIN/paso;
%%%%%%%%%%%%%%%%%%%%
%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.587; volmin=0; v=volfrac;
penal=3;tolx=1;
ft=2;
maxloop=1000;
PorObj=0.5;
er=0.02;
%%%%%%%%%%%%%%%%%%%%
%% PROBLEMA
%%  %% METODO %%
METODO=0; %300 puro 400 combinado
F1=0.7;
Met=0;

%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%
if METODO==100;
    ConvergenciaFEM
else
    A_2D_topUSB
end
xci=round(nely/2);
yci=round(nelx/2);
%Eval_pc

%graf_1
min(uy(:))
