
Sy_e=zeros(nely,nelx);
%% Actualizacion de malla
% for i=1:nmat
%     %% PROPIEDADES ELEMENTALES
%     Sy_e(:)=Sy_e(:)+mesh(:,i)*SyMat(i);
% end

FS=zeros(nely,nelx);
FS(dd>0)=(Sy_e(dd>0)./esfv(dd>0));
  set(0,'DefaultFigureWindowStyle','docked')
fname='FS';cc=FS;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
axis equal