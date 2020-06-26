set(0,'DefaultFigureWindowStyle','normal')
tcpu_B = cputime;
tcpu_total = cputime;
%%%%%%%%%%%%%%%%%
loop=0;loopt=0;
xPor=1;
HOM=0;
paso=lx/(nelx);
MALLADO=3;
%% PREPARE FINITE ELEMENT ANALYSIS
ne=(nely)*(nelx);
nodos=(nely+1)*(nelx+1);
gdl=nodos*2;
%% % INICIALIZANDO
U=zeros(gdl,1);
F=zeros(gdl,1);
Fi=zeros(gdl,1);
detJ(1:ne)=0;
J11(1:ne)=0; J22(1:ne)=0;
J21(1:ne)=0; J12(1:ne)=0;
node=zeros(ne,4);
xe=zeros(ne,4);
ye=zeros(ne,4);
xc=zeros(ne,1);
yc=zeros(ne,1);
passive = zeros(nely,nelx);
al = zeros(nely,nelx);
bl = zeros(nely,nelx);
fixeddofs=[];
%%  LINE 12 to 16 top88
nodenrs = reshape(1:nodos,1+nely,1+nelx);
edofVec = reshape(2*nodenrs(1:end-1,1:end-1)+1, nelx*nely,1);
edofMat =repmat(edofVec,1,8)+repmat([0 1 2*nely+[2 3 0 1] -2 -1],nelx*nely,1);
iK = reshape(kron(edofMat,ones(8,1))',64*nelx*  nely,1);
jK = reshape(kron(edofMat,ones(1,8))',64*nelx*  nely,1);
clear edofVec
%% Grados de libertad en y   % Grados de libertad en x
% (8)_____________(6)       % (7)_____________(5)
%    |            |         %    |            |
%    |            |         %    |            |
%    |            |         %    |            |
% (2)|____________|(4)      % (1)|____________|(3)
%% NODOS
topUSB_2D_node
%% B
topUSB_2D_B % calculo de B
%% INICIALIZACION DE DENSIDADES
x= ones(nely,nelx);
Material=zeros(nely,nelx);
design=x;
mBc=x-1; mBe=x-1;
mCr=x-1; mB=x-1;
mpt=x-1;
xPhys=x;
%% DEFINE LOADS AND SUPPORTS
eval(nproblema);
xPhysA=xPhys.*design;
eval(nxPhys)
eval(nMaterial)
F=Fi;
F=sparse(F);
%% SUPPORTS
fixeddofs = unique(fixeddofs);
fixeddofs=sort(fixeddofs);
%% line 21-22 top88
alldofs = 1:2*(nely+1)*(nelx+1);
freedofs = setdiff(alldofs,fixeddofs);
%% TIEMPO
disp('Geometria listo')
tElapsedcpu_B = cputime-tcpu_B;
tElapsedB = toc(tStartB);
tcpu_M = cputime;
tStartM= tic;
%% DESIGN VIEW
dview=design;
[rowDV,colDV]=find(dview>0);
%% Grafica
%% METODOS
%% centroide del elemento
for i=1:ne
    xc(i,1)=mean(xe(i,:));
    yc(i,1)=mean(ye(i,:));
end
eval(nMaterial)
%%
topUSB_LMetodos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tElapsedcpu_total = cputime-tcpu_total;
tElapsed = toc(tStart);  % tiempo total
disp('////////////////////////////////')
disp('/////////TIEMPOS////////////////')
fprintf('METODO   tM.:%7.3f tcpuM.:%7.3f\n',...
    tElapsedMetodo,tElapsedcpu_M);
fprintf('PRE PROC tB.:%7.3f tcpuB.:%7.3f\n',...
    tElapsedB,tElapsedcpu_B);
fprintf('TOTAL    tT.:%7.3f tcpuT.:%7.3f\n',...
    tElapsed,tElapsedcpu_total);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CENTROIDES
xc=reshape(xc,nely,nelx);
yc=reshape(yc,nely,nelx);
%% VALORES PARA COMPARAR CON APDL
nelem=reshape(1:ne,nelx,nely)';
ycl=flip(yc,1);xcl=flip(xc,1);
xcl=xcl(:);ycl=ycl(:);

%% GRAFICA DE ESTRUCTURA
topUSB_estructura
if METODO==300 || METODO==400
    cdesign= sum(sum(Etot_e.*ce.*design))
    ctot= sum(sum(Etot_e.*ce))
    [ c  tElapsed tElapsedcpu_total mxPhysA loop]
end
if HOM==1
    GRAF_ViewDesign=1;
    dd=design-passive==1;
 fname='Etot_e';cc=Etot_e;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
 colormap(gray)
 GRAF_ViewDesign=0;
end
