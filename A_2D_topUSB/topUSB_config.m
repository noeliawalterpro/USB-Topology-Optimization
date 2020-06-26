disp('topUSB_config')
clear all
close all
%%%%%%%%%%%%%%%%%%%
tStart = tic;
tStartB = tic;
%% INICIALIZANDO
CASO='';
nmetodo='';
nK='';
npenal='';
ncolorMat='';
nMaterial='';
%% hidded
nfem='topUSB_h_2D_fem';
nxPhys='topUSB_h_xPhys';
n_esf_def='topUSB_h_2D_esf_def';
%% CPU USSAGE
% delete(gcp);parpool(2);
%%
set(0,'DefaultFigureWindowStyle','normal')
%% MATERIAL 
HU=0; %1 HOUNFIELD 0 NORMAL
%% MODIFICABLE     % 1 ACTIVO 0 INACTIVO
RESULTADOS=1;
DEFORMADA=1;       % 1 Deformada 0 INDEFORMADA
ELEMENTOS=0;
edo_pdef=0;        % Estado plano de deformaciones 1 ACTIVO
%% GRAFICAS
GRAF_D=0;          % 0 esfuerzos  1 densidades
displaycol=2;  % 1 graf  2 2colums
GRAF_ViewDesign=0; % 1 para  Graficar zona de diseno view design CON PROBLEMAS
flagImagesc=0;     % 1 para graficar con la funcion imagesc CON TODOS ELEMENTOS
iter=5;            % guardar imagenes cada iter
IMAGENES=0;        % EXPORTAR IMAGENES 1 ACTIVO 0 INACTIVO
displayflag=1;  
%% 1  GIF %% 2  screencapture %% 3  saveas %% 4  hgx
%% PREPARATION FILTER
PREF='F_CONV'; %% F_f F_CONV  F_PDE F_HP


%% PUNTO DE CONTROL EN EL CENTRO
nPC='xci=round(nely/2);yci=round(nelx/2);';
%% BONE

nB=1; % 1 cortical y esponjoso 2 modelo cortical puro 

%% LOOP PARAMETERS
%%%%%%%%%%%%%%%%%%%%
volfrac=0.8; volmin=0; v=volfrac;

