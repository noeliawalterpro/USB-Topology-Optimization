
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