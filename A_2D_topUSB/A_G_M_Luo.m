%% Geometria
lx=200;
nelx=Scale*93;
nely=Scale*75;
te=150; %espesor del elemento
paso=lx/nelx;
%% FUERZAS
%%%%%%%%%%%%%%
%% MUSCULOS
ADy=81.6*0.758*0.72;
ADx=81.6*(-0.358)*0.72;

ATy=158*0.988*0.73;
ATx=158*0.044*0.73;

ILP_SLPy=66.90*0.885*.3;
ILP_SLPx=66.90*0.419*.3;

MPy=174.8*0.791*.84;
MPx=174.8*0.372*.84;

MTy=95.6*0.837*.66;
MTx=95.6*(-0.5)*.66;

PTy=75.6*0.474*.59;
PTx=75.6*(-0.855)*.59;

%% DIENTES
ICPy=-1000*4;
ICPx=1;
RMOLy=-1000*2;
RMOLx=1;
INCy=-1000*4;
INCx=1;