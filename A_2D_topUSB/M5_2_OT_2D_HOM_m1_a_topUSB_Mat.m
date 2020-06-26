
%% INITIALIZE ITERATION
HOM=1;
design=design.*xPhys>0.2;
%% micro
Eb= repmat(0,nely,nelx);
Ea=0;
a=amax;
b=(design)*(bmax);
ai=a;
bi=b;
%% Densidad artificial
xPor=1;
xPhys=(1-2*a-pi*b.^2);
topUSB_h_2D_xini
x=xini;
%% LOOP
change = 1;
loop = loop;
c=100;cant=0;
N=1;
changea=100;changeb=100;
%% START ITERATION
while    (loop < maxloop   ) && 1==(abs(cant-c)>0.01*cant || abs(xPor-PorObj)>tolx || changea>0.01 || changeb>0.01 )
    loop= loop + 1;
    cant=c;
    %% FE-ANALYSIS
    eval(nfem)
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    c=0;
    dc=0; Ea=0;Eb=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        eval('topUSB_h_2D_ce_Mat')
        c = c+sum(sum((Emin+xPhys.^penal*(E0-Emin)).*ce));
        %%  SENSITIVITY ANALYSIS
        Eaa=sum(sum((penal*(E0-EMat(1)).*xPhys.^(penal-1).*ce)));
        Ebb=penal*(E0-EMat(1))*xPhys.^(penal-1).*ce.*design;
        
        Ea=(-2).*Eaa+Ea;
        Eb=(-2*pi*bi).*Ebb+Eb;
    end
    
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    eval(SENSb)
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    n=0;
    %l1 = 0; l2 = 1e15; move =0.005;
      l1 = min(min(abs(Ea))); l2 = max(max(abs(Ea)));
    while abs((l2-l1)/l2) > 1.0e-5 
   % while (l2-l1)*(l1+l2) > 1e-15 && n<1000
        lmid =0.5*(l2+l1);
        n=n+1;
        %% UPDATE VARIABLES
        bbe=bi.*(-Eb./lmid);
        bbe2=bi.*(-Eb./lmid).^(-1+move);
        
        F0=bbe<=max(bmin,(1-move)*bi);
        F1=bbe>=min(bmax,(1+move)*bi);
        F2=(F0+F1)==0;
        
        bnew = F0.*min(bmax,(1+move)*bi)+F1.*max(bmin,(1-move)*bi)+F2.*bbe;
        
        amax=min(1-DSmin/paso, (Pmax/paso-2*min(bnew(:)))/sqrt(2));
        
        abe=ai.*(-Ea./lmid);
        abe2=ai.*(-Ea./lmid).^(-1+move);
        F0=abe<=max(amin,(1-move)*ai);
        F1=abe>=min(amax,(1+move)*ai);
        F2=(F0+F1)==0;
        
        anew = F0.*min(amax,(1+move)*ai)+F1.*max(amin,(1-move)*ai)+F2.*abe;
        
        
        %% FILTER
        if ft == 2; eval(DENb); end
        pnew=(anew*sqrt(2)+2*bnew);
        
     
        %%
        xPhysA=design.*(1-2*anew-pi*bnew.^2);
        %% PASIVOS Y ACTIVOS
        xPhysA(passive==1) = 0; %%active
        xPhysA(passive==2) = 1; %%passive
   
        %% Calculo de porosidad
        topUSB_h_P
        %%
        if xPor<PorObj, l1 = lmid;   else l2 = lmid;     end
    end
    change = max(abs(xPhysA(:)-x(:)));
    changea = max(abs(anew(:)-ai(:)));
    changeb = max(abs(bnew(:)-bi(:)));
    ai = anew;
    bi = bnew;
    eval(nxPhys)
    x=xPhysA;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f cha.:%0.3e\n chb.:%0.3e t.:%7.3f\n',loop,c, mean(xPhys(:)),changea,changeb,tfem2);    %% PLOT DENSITIES
    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
    
end
topUSB_graf_microestructura
aa=a(:);
bb=b(:);
al=ai(:);
bl=bi(:);
aaa=ai;
%aaa=ai(min(rowDV):max(rowDV),min(colDV):max(colDV));
bbb=bi(min(rowDV):max(rowDV),min(colDV):max(colDV));
fff=pnew(min(rowDV):max(rowDV),min(colDV):max(colDV));
xxx=xPhysA(dd>0);
disp('/////////parametros entrada////////////////')
fprintf('Poro conectivo   amax.:%0.3e amin.:%0.3e\n',...
    amax,amin);
fprintf('Poro             bmax.:%0.3e bmin.:%0.3e\n',...
    bmax,bmin);
disp('/////////parametros salida////////////////')
fprintf('Poro conectivo   amax.:%0.3e amin.:%0.3e\n',...
    max(max(aaa(:))),min(min(aaa(:))));
fprintf('radio             bmax.:%0.3e bmin.:%0.3e\n',...
    max(max(bbb(:))),min(min(bbb(:))));
fprintf('Poro           pmax.:%0.3e pmin.:%0.3e\n',...
    max(max(fff(:))),min(min(fff(:))));
fprintf('Densidad         xmax.:%0.3e xmin.:%0.3e\n',...
    max(max(xxx(:))),min(min(xxx(:))))
% Efficient topology optimization in MATLAB using 88 lines of code
% Erik Andreassen Anders Clausen Mattias Schevenels
% Boyan S. Lazarov Ole Sigmund
% Received: 19 September 2010 / Revised: 27 October 2010 / Accepted: 28 October 2010 / Published online: 20 November 2010
% c Springer-Verlag 2010