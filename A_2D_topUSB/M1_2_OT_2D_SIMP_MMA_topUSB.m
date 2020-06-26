%% INITIALIZE ITERATION
dc= zeros(nely,nelx);
dv = ones(nely,nelx);%% line 61-68 top88
%% Densidad artificial
xPhys = x*volfrac;
topUSB_h_2D_xini
x=xPhysA;
%% LOOP
change = 1;
cant=0;c=100;
%% START ITERATION
while change > 0.1*(tolx) && loop < maxloop%% && abs(cant-c)>1e-4*cant
    loop= loop + 1;
    %% FE-ANALYSIS
    eval(nfem)
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    c=0;
    dc=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        ce= reshape(sum((Ui(edofMat)*KE).*Ui(edofMat),2),nely,nelx);
        c = c+sum(sum((Emin+xPhys.^penal*(E0-Emin)).*ce));
        %%  SENSITIVITY ANALYSIS
        dc= dc-penal*(E0-Emin)*xPhys.^(penal-1).*ce;
    end
    
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    eval(SENS)
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    % DESIGN UPDATE BY THE OPTIMALITY CRITERIA METHOD
    xlow=0.001; xhigh=1;

L=x-0.1*(xhigh-xlow)*ones(nely,nelx);
high=(x-L).^2.*-dc./(xlow-L).^2;
low=(x-L).^2.*-dc./(xhigh-L).^2; 
l2 = min(min(high));
l1 = max(max(low));
%for i=1:50

while abs((l2-l1)*(l1+l2)) > 1e-3
    %% http://imechanica.org/node/9309
lmid = 0.5*(l2+l1);
xnew=max(xlow,min(xhigh,L+abs(x-L).*sqrt(-dc./lmid)));
xnew(:) = (H*xnew(:))./Hs;
xPhysA=xnew.*design;
if sum(sum(xnew)) - volfrac*nelx*nely > 0; l2 = lmid; else l1 = lmid; end
end
 
    change = max(abs(xPhysA(:)-x(:)));
    eval(nxPhys)
    x=xPhysA;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f ch.:%7.3f t.:%7.3f\n',loop,c, mean(xPhys(:)),change,tfem2 );
    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
end
%% SIMP
% Efficient topology optimization in MATLAB using 88 lines of code
% Erik Andreassen · Anders Clausen · Mattias Schevenels ·
% Boyan S. Lazarov · Ole Sigmund
% Received: 19 September 2010 / Revised: 27 October 2010 / Accepted: 28 October 2010 / Published online: 20 November 2010
% c Springer-Verlag 2010


%% MMA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This Matlab code was written by Andreas Rietz, Department of Mechanics %
% at Linkoping University, Sweden %
% %
% The syntax of the code has been revised since february 1999 to be more %
% similar to the optimization code described in %
% "A 99 line topology optimization code written in Matlab" %
% by Ole Sigmund (To appear in Structural Optimization). %
% The code as well as a postscript version of the paper can be %