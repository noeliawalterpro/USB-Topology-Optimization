%% INITIALIZE ITERATION
HOM=1;
design=design.*xPhys>0.2;
%% micro
Ea=0;
Eb=0;
penalM1=1.5;
a=amin;b=bmin+tolx;
ai=a;bi=b;
%% Densidad artificial
xPor=1;
xPhys=(1-2*a-pi*b.^2);
topUSB_h_2D_xini
x=xini;
%% LOOP
change = 1;
c=100;
cant=0;
N=1;
changea=100;changeb=100;
changec=100;
changepor=100;
%% START ITERATION
while   (loop < maxloop ) && 1==( changec>tolx || changepor>tolx || changea>tolx ||  changeb>(tolx)) 
    loop= loop + 1;
    cant=c;
    %% FE-ANALYSIS
    eval(nfem)
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    c=0;
    dc=0;
    Ea=0;Eb=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        eval('topUSB_h_2D_ce_Mat')
        c= c+sum(sum((Emin+xPhys.^penal.*(E0-Emin)).*ce.*design));
        %c=c+ sum(sum(Etot_e.*ce));
        %%  SENSITIVITY ANALYSIS
        Eaa=sum(sum(penal*(E0-Emin).*xPhys.^(penal-1).*ce.*design));
        
        Ea=(-2).*Eaa+Ea;
        Eb=(-2*pi*bi).*Eaa+Eb;
    end
    
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
   loopa=0;
 l1 = 0; l2 = 1e6; move =0.1;
    % l1 = min(min(abs(Ea))); l2 = max(max(abs(Ea)));
   % while abs((l2-l1)/l2) > 1.0e-5 
    while (l2-l1)*(l1+l2) >1e-15%&& loopa<2000



        lmid =0.5*(l2+l1);
        loopa=loopa+1;
        %% UPDATE VARIABLES  
        bbe=bi.*(-Eb./lmid);
     
        F0=bbe<=max(bmin,(1-move)*bi);
        F1=bbe>=min(bmax,(1+move)*bi);
        F2=(F0+F1)==0;
        
        bnew = F0.*min(bmax,(1+move)*bi)+F1.*max(bmin,(1-move)*bi)+F2.*bbe;
                      
        amax=min(1-DSmin/paso, (Pmax/paso-2*bnew)/sqrt(2));
        
        abe=ai.*(-Ea./lmid);
       
        F0=abe<=max(amin,(1-move)*ai);
        F1=abe>=min(amax,(1+move)*ai);
        
        F2=(F0+F1)==0;
        
        anew = F0.*min(amax,(1+move)*ai)+F1.*max(amin,(1-move)*ai)+F2.*abe;
                          
        pnew=(anew*sqrt(2)+2*bnew)
        %%
        xPhysA=design.*(1-2*anew-pi*bnew.^2);
        %% PASIVOS Y ACTIVOS
        xPhysA(passive==1) = 0;
        xPhysA(passive==2) = 1;
           
        %% Calculo de porosidad
        topUSB_h_P
        %%
        if xPor>PorObj, l1 = lmid;   else l2 = lmid;     end
    end
    change = max(abs(xPhysA(:)-x(:)));
    changea = max(abs(anew(:)-ai(:)));
    changeb = max(abs(bnew(:)-bi(:)));
    changec=abs(cant-c)/cant;
    changepor=abs(xPor-PorObj)*100;
    ai = anew;
    bi = bnew;
    eval(nxPhys)
     topUSB_h_P
    x=xPhysA;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f cha.:%0.3e\n chb.:%0.3e t.:%7.3f\n',loop,c, mean(xPhys(:)),changea,changeb,tfem2);
    preal=(anew*sqrt(2)+2*bnew)*paso
    [anew bnew]*paso
    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
    
end
topUSB_graf_microestructura
aa=a(:);
bb=b(:);
al=ai(:);
bl=bi(:);
areal=ai*paso*1000  %%[micro m]
breal=bi*paso*1000  %%[micro m]

aaa=ai;
bbb=bi;
fff=pnew;
%aaa=ai(min(rowDV):max(rowDV),min(colDV):max(colDV));
%bbb=bi(min(rowDV):max(rowDV),min(colDV):max(colDV));
%fff=pnew(min(rowDV):max(rowDV),min(colDV):max(colDV));
xxx=xPhysA(dd>0);
disp('/////////parametros entrada////////////////')
fprintf('Poro conectivo ´[micro m]  amax.:%0.3f amin.:%0.3f\n',...
    amax*paso*1000,amin*paso*1000);
fprintf('Poro             bmax.:%0.3f bmin.:%0.3f\n',...
    bmax*paso*1000,bmin*paso*1000);
disp('/////////parametros salida////////////////')
fprintf('Poro conectivo  [micro m]  amax.:%0.3f amin.:%0.3f\n',...
    max(max(aaa(:)))*paso*1000,min(min(aaa(:))))*paso*1000;
fprintf('radio           [micro m]  bmax.:%0.3f bmin.:%0.3f\n',...
    max(max(bbb(:)))*paso*1000,min(min(bbb(:))))*paso*1000;
fprintf('Poro            [micro m]  pmax.:%0.3f pmin.:%0.3f\n',...
    max(max(fff(:)))*paso*1000,min(min(fff(:))))*paso*1000;
fprintf('Densidad         xmax.:%0.3f xmin.:%0.3f\n',...
    max(max(xxx(:))),min(min(xxx(:))))
% Efficient topology optimization in MATLAB using 88 lines of code
% Erik Andreassen Anders Clausen Mattias Schevenels
% Boyan S. Lazarov Ole Sigmund
% Received: 19 September 2010 / Revised: 27 October 2010 / Accepted: 28 October 2010 / Published online: 20 November 2010
% c Springer-Verlag 2010