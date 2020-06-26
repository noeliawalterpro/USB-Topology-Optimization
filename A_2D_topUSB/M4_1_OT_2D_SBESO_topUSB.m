%% INITIALIZE ITERATION
dc= zeros(nely,nelx);
dv = ones(nely,nelx);

%% Densidad artificial
xPhys = x;
%%
topUSB_h_2D_xini
%%
xPor=1;
x=xPhysA;
%% LOOP
vol=1;
change = 1;
cant=0;c=100;

%% START ITERATION
while  loop < maxloop && (abs(mxPhysA-volfrac)> tolx  ||  change >(tolx) )
    loop= loop + 1; vol = max(vol*(1-er),volfrac) ;
    if loop >1 ; olddc = dc; end
    %% FE-ANALYSIS
    eval(nfem)
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    c=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        ce=reshape(sum((Ui(edofMat)*KE).*Ui(edofMat),2),nely,nelx);
        %c =c+sum(sum((Emin+0.5*xPhys.^penal*(E0-Emin)).*ce.*design));
        c = c+sum(sum((Emin+xPhys.^penal*(E0-Emin)).*ce));
      
        %%  SENSITIVITY ANALYSIS
        dc=0.5*penal*(E0-Emin)*xPhys.^(penal-1).*ce-dc;
    end
    cact(loop)=c;
    %% FILTERING/MODIFICATION OF SENSITIVITIES
   if ft==2,   eval(SENS),end
    %% STABLIZATI ON OF EVOLUTIONARY PROCESS
    if loop > 1 ; dc=(dc+olddc)/2.; end
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    n=0;
    l1 = min(min(dc)); l2 = max(max(dc));
    while abs((l2-l1)/l2) > 1.0e-5
        th = (l1+l2)/2.0;
        xnew= max(0.001,sign(dc-th));
        %% PASIVOS Y ACTIVOS
        xnew(passive==1) = 0;
        xnew(passive==2) = 1;
        %% CALCULO DE DENSIDAD
        xPhysA=xnew.*design;
        %%
        if sum(xPhysA(:))/neA> vol;    l1=th;else l2=th;end
    end
%     if loop>10;
%         change=abs(sum(cact(loop-9:loop-5)) - sum(cact(loop-4:loop)))/sum(cact(loop-4:loop)) ;
%     end
change = abs(c-cant)/cant;
    %%
    eval(nxPhys)
    x=xPhysA;
    %% PRINT RESULTS
   fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f ch.:%7.3f t.:%7.3f\n',loop,c, mean(xPhys(:)),change,tfem2);
    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
end

% Struct Multidisc Optim (2010) 41:671–683
% DOI 10.1007/s00158-010-0487-9
% FORUM DISCUSSION
% A further review of ESO type methods for topology optimization
% Xiaodong Huang · Yi-Min Xie
% Received: 22 July 2008 / Revised: 11 November 2009 / Accepted: 27 January 2010 / Published online: 6 March 2010
% c Springer-Verlag 2010