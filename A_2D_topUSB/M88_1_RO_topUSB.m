%% INITIALIZE ITERATION
dc= zeros(nely,nelx);
dv = ones(nely,nelx);%% line 61-68 top88
%% densidad artificial
xPhys = x*volfrac;
topUSB_h_2D_xini
x=volfrac.*design;
%% LOOP
change = 100;
cant=0;c=100;
%% START ITERATION
while (change > tolx && loop < maxloop) && 1==( abs(cant-c)/cant>tolx || abs(mxPhysA-volfrac) > tolx) %&& abs(cant-c)/cant> 1e-4*tolx
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
    n=0;
    l1 = 0; l2 = 1e9; move =0.2;
    while (l2-l1)*(l1+l2) > 1e-4*tolx && n<1000
        n=n+1;
        lmid =0.5*(l2+l1);
        xnew = max(vmin,max((x-move),min(vmax,min((x+move),x.*sqrt(-dc./dv./lmid)))));  %0.000060 s
      %  xnew = max(vmin,max(x*(1-move),min(vmax,min(x*(1+move),x.*sqrt(-dc./dv./lmid)))));  %0.000060 s
        
        %% FILTRO
        if ft == 2
           eval(DEN)
        end
        %% PASIVOS Y ACTIVOS
        xnew(passive==1) = 0;
        xnew(passive==2) = 1;
        %%
     
        xPhysA=xnew.*design;
        mxPhysA=sum(sum(xPhysA))/neA;
        if  mxPhysA > volfrac; l1=  lmid; else l2 = lmid; end
    end
    eval(npenal)
    change = max(abs(xPhysA(:)-x(:)));
    eval(nxPhys)
    x=xPhysA;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f ch.:%7.3f t.:%7.3f\n',loop,c, mean(xPhys(:)),change,tfem2 );
    %% PLOT DENSITIES
    if displayflag==1;topUSB_h_graf; end
end
errorV=(volfrac-mxPhysA )/volfrac*100
% Efficient topology optimization in MATLAB using 88 lines of code
% Erik Andreassen · Anders Clausen · Mattias Schevenels ·
% Boyan S. Lazarov · Ole Sigmund
% Received: 19 September 2010 / Revised: 27 October 2010 / Accepted: 28 October 2010 / Published online: 20 November 2010
% c Springer-Verlag 2010
