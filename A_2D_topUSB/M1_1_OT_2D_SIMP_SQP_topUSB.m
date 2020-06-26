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
    n=0;
    l1 = 0; l2 = 1e9; move = 0.2*(tolx);
    
    while  (l2-l1)*(l1+l2) > 1e-3*(tolx) && n<1000
        n=n+1;
        lmid =0.5*(l2+l1);
        Hc=2*(penal*(E0-Emin)*xPhys.^(penal-1)).^2 ...
            /(E0+(E0-Emin)*xPhys.^penal).*ce;
        % FILTRO
        if ft == 2
            eval(DENHc)
        end
        xnew=x+alfa*d;
        %% PASIVOS Y ACTIVOS
        xnew(passive==1) = 0;
        xnew(passive==2) = 1;
        %%
        xPhysA=xnew.*design;
        
        if  sum(xPhysA(:))/neA > volfrac; l1=  lmid; else l2 = lmid; end
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

% Efficient topology optimization in MATLAB using 88 lines of code
% Erik Andreassen · Anders Clausen · Mattias Schevenels ·
% Boyan S. Lazarov · Ole Sigmund
% Received: 19 September 2010 / Revised: 27 October 2010 / Accepted: 28 October 2010 / Published online: 20 November 2010
% c Springer-Verlag 2010
