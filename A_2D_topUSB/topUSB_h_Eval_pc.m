%% punto control
pcontrol=zeros(nely,nelx);
eval(nPC)
pcontrol(xci,yci)=1;
pc= find(pcontrol==1);
Svm=esfv(pc);
Ux=ux(pc); Uy=uy(pc);
Sx=esfx(pc); Sy=esfy(pc);
pc= find(pcontrol==1);
nelem(pc);
paso;
%% PRINT RESULTS en Punto de control
disp('////////////////////////////////')
disp('/////////PUNTO DE CONTROL///////')
fprintf('nele.:%7.3f Y.:%7.3f X.:%7.3f\n',...
    nelem(pc),xci*paso,yci*paso);
fprintf('Paso.:%7.3f\n',...
    paso);
fprintf('Svm.:%7.5f Sx.:%7.5f Sy.:%7.5f\n',...
    Svm,Sx,Sy);
% Svm
% Sy
% Sx
fprintf('Ux.:%0.3e Uy.:%0.3e\n',...
    Ux,Uy);
% Uy
% Ux
%%%%%%%%%%%%%%%%%%%%%%%%%
