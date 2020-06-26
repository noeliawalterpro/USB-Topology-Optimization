%% DICOM
HU=1;
nB=2;

%% Geometria
lx=108.4214;%[mm]
nely=Scale*200;
nelx=Scale*50;
te=10; %espesor del elemento
ne=nelx*nely;
%%%
paso=lx/nelx;
ly=nely*paso;
nPC='xci=round(nely/3);yci=round(nelx/3);';


%% PROPIEDADES DEL MATERIAL
%% (OSEO)PROPIEDADES DEL MATERIAL
EB=3.772e3;%3.772e12 El modelo utilizó una de las relaciones disponibles para el módulo de Young, propuesto por Carter y Hayes en 1977 que expresa el módulo de Young de la siguiente manera 
nuB=0.3;
SyB=1;
%%Hounfield a partir de DICOM
HUmax=2593;
HUmin=784;
%%miguel cerrolaza
Dmax=1.9; %g/cmm3  cortical
Dmin=0.14;%g/cmm3  esponjoso 0.14 to 1.10
%% CORTICAL
nuBc=0.36;
EBc=19.9e3;%[MPa]
SyBc=108;
%% ESPONJOSO
nuBe=0.36;
EBe=2e3;%[MPa]
SyBe=SyBc;
%% titanio
nupt=0.342;
Ept=110e3;%[MPa]
Sypt=1100;
%% PLLA
nuPLLA=0.3;
EPLLA=3.7e3;
SyPLLA=56;
%% IMPLANTE
nu=0.342;
E0=110e3;
Sy0=1100;
Emin=16e3*1e-9;%% MATERIAL VACIO
%% F1
Caderay=-1886;%[N]
Caderax=-790;%[N]
%% mglutei
mgluteiy=+312.1;%[N]
mgluteix=225.7;%[N]
%% mgluteus
mgluteusy=+223.8;%[N]
mgluteusx=169.6;%[N]
%% miliopsas
miliopsoasy=+55.8;%[N]
miliopsoasx=-0.5;%[N]
%% mpiriformis
mpiriformisy=+34.9;%[N]
mpiriformisx=104.0;%[N]
%% mvastus
mvastusy=-813.0;%[N]
mvastusx=42.0;%[N]
%%
nPC='xci=round(nely/2.7);yci=round(nelx/2.5);';