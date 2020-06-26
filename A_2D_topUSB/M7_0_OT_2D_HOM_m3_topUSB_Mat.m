
%% INITIALIZE ITERATION
HOM=1;
%% micro
nmicro='micro_square';
Ea= repmat(0,nely,nelx);
Eb= repmat(0,nely,nelx);

a=(amax);
ai=a; 
%% Densidad artificial
xPhys=(1-pi*a^2/4)
if maxloop>1
    a=(amax)*(1-PorObj)^0.5;
end
ai=a;
%% Densidad artificial
topUSB_h_2D_xini
x=xini;
%% LOOP
change = 1;changea=100;changeb=100;
c=100;cant=0;
%% START ITERATION
while  (loop < maxloop && (changea>0.1*(tolx)  && abs(cant-c)/cant>0.01*tolx))
  
    loop= loop + 1;
    %% FE-ANALYSIS
    eval(nfem)
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    c=0;
    dc=0;
    Ea=0;Eb=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        eval('topUSB_h_2D_ce_Mat')
         c = c+sum(sum((EMat(1)+xPhys.^penal.*(E0-EMat(1))).*ce.*design));
        %%  SENSITIVITY ANALYSIS
        Eaa=penal*(E0-EMat(1)).*xPhys.^(penal-1).*ce.*design;
        Ea=Ea-a.*Eaa;
    end
    
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    eval(SENSa)
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    n=0;
    l1 = 0; l2 = 1e9; move =0.01;
    
    while (l2-l1)*(l1+l2) > 1e-15 && n<1000
        lmid =0.5*(l2+l1);
        n=n+1;
        %% UPDATE VARIABLES
        %% a
        abe=ai.*(-Ea./lmid);
        abe2=ai.*(-Ea./lmid).^(-1+move);
        F0=abe<=max(amin,(1-move)*ai);
        F1=abe>=min(amax,(1+move)*ai);
        F2=(F0+F1)==0;
        
        anew = F0.*min(amax,(1+move)*ai)+F1.*max(amin,(1-move)*ai)+F2.*abe;
         %% FILTER
        if ft == 2; eval(DENa); end
        %% CALCULO DE DENSIDAD
        xPhysA=design.*(1-pi*anew.^2/4);
        %% PASIVOS Y ACTIVOS
        xPhysA(passive==1) = 0; 
        xPhysA(passive==2) = 1; 
        %% CALCULO DE POROSIDAD
        topUSB_h_P
        %%
        if xPor<PorObj, l1 = lmid;   else l2 = lmid;     end
        
    end
    change = max(abs(xPhys(:)-x(:)));
    changea = max(abs(anew(:)-ai(:)));
   
    ai = anew;

    eval(nxPhys)
    x=xPhys;%*0.5+0.5;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f cha.:%7.3f\n chb.:%7.3f\n',loop,c, mean(xPhys(:)),changea,changeb);
    %% PLOT DENSITIES
      mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
end
topUSB_graf_microestructura
aa=a(:);

al=ai(:);

