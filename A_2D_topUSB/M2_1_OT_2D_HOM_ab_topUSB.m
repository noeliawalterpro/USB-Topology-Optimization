
%% INITIALIZE ITERATION
HOM=1;
xPor=1;
%% micro
nmicro='micro_square';
Ea=0;Eb=0;
ai=a; bi=b;
design=design.*xPhys>0.2;
%% Densidad artificial
xPhys=(1-a*b)
if xPhys>PorObj
    disp('Porosidad Objetivo menor a la posible')
    disp(strcat('Porosidad minima=',num2str(xPhys)))
    disp(strcat('Paso=',num2str(paso)))
    disp('PRESIONAR CTR+C PARA DETENER')
    pause
    
end
if maxloop>1
a=(vmax)*(1-PorObj)^0.5;
b=(vmax)*(1-PorObj)^0.5;
end
ai=a;
bi=b;

xPhys=(1-a*b).*design;
%%
topUSB_h_2D_xini
x=xini;

%% LOOP
change = 1;changea=100;changeb=100;
c=100;cant=0;
N=1;
%% START ITERATION
while    (loop < maxloop && (changea>0.01 && changeb>0.01) && abs(cant-c)>1e-4*cant)
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
        Eaa=sum(sum(penal*(Emin+xPhys.^(penal-1)*(E0-Emin)).*ce.*design));
        Ea=Ea-b.*Eaa;
        Eb=Eb-a.*Eaa;
    end
    %% FILTER
    %eval(SENSab)
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    n=0;l1 = 0; l2 = 1e9; move = 0.05;
    
    while (l2-l1)*(l1+l2) > 1e-4 %&& n<1000
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
        %% b        
        bbe=bi.*(-Eb./lmid);
        bbe2=bi.*(-Eb./lmid).^(-1+move);
        F0=bbe<=max(bmin,(1-move)*bi);
        F1=bbe>=min(bmax,(1+move)*bi);
        F2=(F0+F1)==0;
        
        bnew = F0.*min(bmax,(1+move)*bi)+F1.*max(bmin,(1-move)*bi)+F2.*bbe;
        
%         %% PASIVOS Y ACTIVOS
%         anew(passive==1) = 0;
%         anew(passive==2) = 1;
%         bnew(passive==1) = 0;
%         bnew(passive==2) = 1;
        %% calculo de densidad
        xPhysA=design.*(1-anew.*bnew);
        %% PASIVOS Y ACTIVOS
        xPhysA(passive==1) = 1; %%active
        xPhysA(passive==2) = 0; %%passive
        %% Calculo de porosidad
        topUSB_h_P
        %%
        if xPor<PorObj, l1 = lmid;   else l2 = lmid;     end

    end
    change = max(abs(xPhys(:)-x(:)));
    changea = max(abs(anew(:)-ai(:)));
    changeb = max(abs(bnew(:)-bi(:)));
    ai = anew;
    bi = bnew;
    eval(nxPhys)
    topUSB_h_P
    x=xPhys;%*0.5+0.5;
    %% PRINT RESULTS
  fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f cha.:%0.3e\n chb.:%0.3e t.:%7.3f\n',loop,c, mean(xPhys(:)),changea,changeb,tfem2);    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf;    end
    
end
aa=a(:);
bb=b(:);
al=ai(:);
bl=bi(:);
HOM=1;
