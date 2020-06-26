
%% INITIALIZE ITERATION
HOM=1;
Ea= repmat(0,nely,nelx);
Eb= repmat(0,nely,nelx);
design=design.*xPhys>0.2;
a=(vmax);b=(vmax);
ai=a;
bi=b;
dv=0;
%% Densidad artificial
xPhys=(1-a*b);
if xPhys>PorObj
    disp('Porosidad Objetivo menor a la posible')
    disp(strcat('Porosidad minima=',num2str(xPhys)))
   disp(strcat('Paso=',num2str(paso)))
   disp('PRESIONAR CTR+C PARA DETENER')
   pause
   
end
a=(vmax)*(1-PorObj)^0.5;
b=(vmax)*(1-PorObj)^0.5;
ai=a;
bi=b;
xPhys=(1-a*b).*design;

%%
topUSB_h_2D_xini
x=xini;
%% LOOP
change = 1;
loop = loop;
c=100;cant=0;
N=1;
changea=100;changeb=100;
%% START ITERATION
while    loop < maxloop && changea>0.001 && changeb>0.001 && abs(cant-c)>1e-4*cant
    loop= loop + 1;
    %% FE-ANALYSIS
    eval(nfem)
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    c=0;Eb=0;Ea=0;
    dc=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        ce= reshape(sum((Ui(edofMat)*KE).*Ui(edofMat),2),nely,nelx);
        c = c+sum(sum((Emin+xPhys.^penal*(E0-Emin)).*ce));
        %%  SENSITIVITY ANALYSIS
        Eaa=0.5*penal*(E0-Emin)*xPhys.^(penal-1).*ce.*design;
        Ebb=0.5*penal*(E0-Emin)*xPhys.^(penal-1).*ce.*design;
        Ea=Ea-b.*Eaa;
        Eb=Ea-a.*Ebb;
    end
    
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    eval(SENS)
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    n=0;l1 = 0; l2 = 1e9; move = 0.05;
    
    while (l2-l1)*(l1+l2) > 1e-4 %&& n<1000
        lmid =0.5*(l2+l1);
        n=n+1;
        %% UPDATE VARIABLES
        %F0=ai*0;F1=ai*0;F2=ai*0;
        abe=ai.*((-Ea./lmid).^(-1./ai));
        abe2=ai.*(-Ea./lmid);
        F0=abe2<=max(vmin,(1-move)*ai);
        F1=abe2>=min(vmax,(1+move)*ai);
        F2=(F0+F1)==0;
        
        anew = F0.*min(vmax,(1+move/norm(ai-move))*ai)+F1.*max(vmin,(1-move/norm(ai-move))*ai)+F2.*abe;
        
        
        %F0=bi*0;F1=bi*0;F2=bi*0;
        bbe=bi.*((-Eb./lmid).^(-1./bi));
        bbe2=bi.*(-Eb./lmid);
        F0=bbe2<=max(vmin,(1-move)*bi);
        F1=bbe2>=min(vmax,(1+move)*bi);
        F2=(F0+F1)==0;
        
        bnew = F0.*min(vmax,(1+move/norm(bi-move))*bi)+F1.*max(vmin,1-move/norm(bi-move))+F2.*bbe;
        %% FILTER
        eval(DEN)
        %% PASIVOS Y ACTIVOS
        anew(passive==1) = 0;
        anew(passive==2) = 1;
        bnew(passive==1) = 0;
        bnew(passive==2) = 1;
        %%
        xPhysA=design.*(1-anew.*bnew);
        
        topUSB_h_P
        
        if xPor>PorObj, l1 = lmid;   else l2 = lmid;     end
        %         if  sum(xPhysA(:))/neA > volfrac, l1 = lmid;   else l2 = lmid;     end
        %
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
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f cha.:%0.3e\n chb.:%0.3e t.:%7.3f\n',loop,c, mean(xPhys(:)),changea,changeb,tfem2);  %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1; topUSB_h_graf; end
    
end
aa=a(:);
bb=b(:);
al=ai(:);
bl=bi(:);

% Efficient topology optimization in MATLAB using 88 lines of code
% Erik Andreassen Anders Clausen Mattias Schevenels
% Boyan S. Lazarov Ole Sigmund
% Received: 19 September 2010 / Revised: 27 October 2010 / Accepted: 28 October 2010 / Published online: 20 November 2010
% c Springer-Verlag 2010