
%% INITIALIZE ITERATION
HOM=1;
design=design.*xPhys>0.2;
%% micro
Ea= zeros(nely,nelx);
Eb= zeros(nely,nelx);
a=(design)*(0.25);
b=(design)*(0.25);
ai=a;bi=b;
%% densidad artificial
xPhys=(1-a-b);
topUSB_h_2D_xini
x=xini;
%% LOOP Inializando
change = 1;
loop = loop;
c=100;cant=0;
N=1;
changea=100;changeb=100;
%% START ITERATION
while    loop < maxloop && (changea>0.02 && changeb>0.02) && abs(cant-c)>1e-5*cant
    loop= loop + 1;
    %% FE-ANALYSIS
    eval(nfem)
    %% Sensitivity
    Ea=0.5*penal*(E0-Emin)*xPhys.^(penal-1).*ce.*design;
    Eb=0.5*penal*(E0-Emin)*xPhys.^(penal-1).*ce.*design;
    Ea=-1.*Ea;
    Eb=-1.*Eb;
 
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    eval(SENSab)
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    n=0;l1 = 0; l2 = 1e9; move = 0.1;
    
    while (l2-l1)*(l1+l2) > 1e-6 %&& n<1000
        lmid =0.5*(l2+l1);
        n=n+1;
        %% UPDATE VARIABLES
        %F0=ai*0;F1=ai*0;F2=ai*0;
        abe=ai.*(-Ea./lmid);
        abe2=ai.*(-Ea./lmid).^(-1+move);
        F0=abe<=max(vmin,(1-move)*ai);
        F1=abe>=min(vmax,(1+move)*ai);
        F2=(F0+F1)==0;
        
        anew = F0.*min(vmax,(1+move)*ai)+F1.*max(vmin,(1-move)*ai)+F2.*abe;
        
        
        %F0=bi*0;F1=bi*0;F2=bi*0;
        bbe=bi.*(-Eb./lmid);
        bbe2=bi.*(-Eb./lmid).^(-1+move);
        F0=bbe<=max(vmin,(1-move)*bi);
        F1=bbe>=min(vmax,(1+move)*bi);
        F2=(F0+F1)==0;
        
        bnew = F0.*min(vmax,(1+move)*bi)+F1.*max(vmin,(1-move)*bi)+F2.*bbe;
     
        %% FILTER
        if ft == 2; eval(DENab); end
        %% PASIVOS Y ACTIVOS
        anew(passive==1) = 0;
        anew(passive==2) = 1;
        bnew(passive==1) = 0;
        bnew(passive==2) = 1;
        %%
        xPhysA=design.*(1-anew-bnew);
        
        topUSB_h_P
        if xPor>PorObj, l1 = lmid;   else l2 = lmid;     end
        
    end
    change = max(abs(xPhys(:)-x(:)));
    changea = max(abs(anew(:)-ai(:)));
    changeb = max(abs(bnew(:)-bi(:)));
    ai = anew;
    bi = bnew;
    eval(nxPhys)
    x=xPhysA;
    %% PRINT RESULTS
   fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f cha.:%0.3e\n chb.:%0.3e t.:%7.3f\n',loop,c, mean(xPhys(:)),changea,changeb,tfem2);   %% PLOT DENSITIES
    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
    
end
aa=a(:);
bb=b(:);
al=ai(:);
bl=bi(:);
% Efficient topology optimization in MATLAB using 88 lines of code
% Erik Andreassen · Anders Clausen · Mattias Schevenels ·
% Boyan S. Lazarov · Ole Sigmund
% Received: 19 September 2010 / Revised: 27 October 2010 / Accepted: 28 October 2010 / Published online: 20 November 2010
% c Springer-Verlag 2010
