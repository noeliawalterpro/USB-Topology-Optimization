%% DICOM
HU=0;
nB=0;
%% Geometria
lx=430/3.7*0.96;
nelx=Scale*50;
nely=Scale*200;
te=35; %espesor del elemento
paso=lx/nelx;
ly=nely*paso;
%%
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
%% F1
Caderay=-1700;%[N]
Caderax=-400;%[N]
%% F2
Tendony=703*sin(28*pi/180);%[N]
Tendonx=703*cos(28*pi/180);%[N]

%% PROPIEDADES DEL MATERIAL (TITANIO)
nu=0.3;
E0=90e3;
Emin=16e3*1e-9;%% MATERIAL VACIO
Sy0=1100;%[MPa]
%% CORTICAL
nuBc=0.3;
EBc=16.0e3;%[MPa]
SyBc=113;%[MPa]
%% ESPONJOSO
nuBe=0.3;
EBe=2.0e3;%[MPa]
SyBe=20;
%% CROMO
nuCr=0.3;
ECr=230.0e3;%[MPa]
SyCr=534;%[MPa]
nPC='xci=round(nely/6);yci=round(nelx/2.5);';