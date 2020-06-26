%% INICIALIZANDO
dv=zeros(nely,nelx);
%% ESO
ERe=round(neA*ERR); % elementos removibles
design=design.*xPhys>0.2;
%% Densidad artificial
topUSB_h_2D_xini
%% LOOP
n=1;
loop = 0;
change = 100;
c=0; cant=100;
RR=ERR;
mxPhysA=sum(sum(xPhysA))/neA;
%% START ITERATION
while  ( change >tolx && loop < maxloop) && abs(mxPhysA-volfrac)> tolx  
     loop= loop + 1;
    %% FE-ANALYSIS
    eval(nfem)
    
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    ce=zeros(nely,nelx);
    dc=0;
    c=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        eval('topUSB_h_2D_ce_Mat')
        c = c+sum(sum(Etot_e.*ce));
        %%  SENSITIVITY ANALYSIS
        dc=dc+penal*(E0-Emin)*xPhys.^(penal-1).*ce;
    end
    
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    if ft==2,   eval(SENS),end
    %% ESO
    SMAX=max(dc(:));
    [M,IERe]=sort(dc(:));  % I elementos con menor esfuerzo
    aa=1; bb=0;  ii=0;
    %%  UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    while  aa==1 && bb<ERe &&  mxPhysA>volfrac && ii<ne
        ii=ii+1;
        k=IERe(ii);
        if  xPhysA(k)>volmin   && dc(k)<RR*SMAX && passive(k)==0%&& sum(k==efix)==0
            xnew(k)=volmin;
            bb=bb+1;
        end
    end
    %% PASIVOS Y ACTIVOS
    xnew(passive==1) = 0;
    xnew(passive==2) = 1;
    %% CALCULO DE DENSIDAD
    xPhysA=xnew.*design;
    eval(nxPhys)
    %%
    RR=RR+ERR;
    change = max(abs(xnew(:)-x(:)));
    x = xnew;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f ch.:%7.3f t.:%7.3f\n',loop,c, mean(xPhys(:)),change,tfem2);
    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
end

d2=xPhysA;
