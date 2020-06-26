%% INITIALIZE ITERATION

dv=zeros(nely,nelx);
%% PREPARE FILTER  (Line 23 to 44 )
iH = ones(nelx*nely*(2*(ceil(rmin)-1)+1)^2,1);
jH = ones(size(iH));
sH = zeros(size(iH));
k = 0;
R2=1.4142;
for i1 = 1:nelx
    for j1 = 1:nely
        el = (i1-1)*nely+j1;
        for i2 = max(i1-(ceil(R2)-1),1):min(i1+( ceil(R2)-1),nelx)
            for j2 = max(j1-(ceil(R2)-1),1):min(j1+( ceil(R2)-1),nely)
                e2 = (i2-1)*nely+j2;
                k = k+1;
                
                iH(k) = el;
                jH(k) = e2;
                sH(k) = max(0,R2-sqrt((i1-i2)^2+(j1-j2)^2));
            end
        end
    end
end
Hadd = sparse(iH,jH,sH);
clear iH jH sH
Hadds = sum(Hadd,2);
%% Densidad artificial
xPhys=x;
%%
topUSB_h_2D_xini
%% LOOP
%loop = 0;
change = 100;
c=0;cant=100;
n=1;
ER=ERR;
IR=1-IRR;
mxPhysA=sum(sum(xPhysA))/neA;
%% START ITERATION
while  (loop < maxloop && change~=0)&& (abs(mxPhysA-volfrac)> tolx  ||  change >0.1*(tolx) ) 
    loop= loop + 1;
    anade=0;elimina=0;
    cant=c;
    %% FE-ANALYSIS
    eval(nfem)
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    ce=zeros(nely,nelx);
    dc=0;
    c=0;
    for i= 1:size(F,2)
        Ui=U(:,i);
        ce=ce+ reshape(sum((Ui(edofMat)*KE).*Ui(edofMat),2),nely,nelx);
       
      %  ce=ce+esfv./Etot_e;%% esfuerzo
        c = c+sum(sum((Emin+xPhys.^penal*(E0-Emin)).*ce)); 
        %%  SENSITIVITY ANALYSIS
        dc=0.5*penal*(E0-Emin)*xPhys.^(penal-1).*ce.*design-dc;
    end
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    if ft==2,   eval(SENS),end
    %% SORT
    SMAX=mean(dc(:));
  
IRe=round(neA*IRR); % elementos removibles
    [M,IERe]=sort(dc(:));  % I elementos con menor esfuerzo
    %if mod(loop,2)
    %% ADD
    a=1;
    bb=0;
    i=ne+1;
    xnew=xPhys;
    while i>1  && bb<IRe
        i=i-1;
        k=IERe(i);
        
        if xPhysA(k)<1 && k>1 && passive(k)==0  && dc(k)>IR*SMAX %%
            anade=anade+1;
            cerca=find(Hadd(:,k));
            for j=1:max(size(cerca))
                gg=cerca(j);
                if gg~=k %&& xPhys(k)<volmin
                    xnew(gg)=1;
                    xnew(k)=1;
                    bb=bb+1;
                    %      disp('anade')
                end
            end
        end
    end
  %  end
    %% REMOVE
      ERe=round(neA*ERR); % elementos removibles
    aa=1;
    bb=0;
    ii=0;
    %%  UPDATE OF DESIGN VARIABLES AND PHYSICAL DENSITIES
    while  aa==1 && bb<ERe &&  mxPhysA>volfrac && ii<ne-1
        ii=ii+1;
        k=IERe(ii);
        if  xPhysA(k)==1 && dc(k)<ER*SMAX && passive(k)==0%&& sum(k==efix)==0
            xnew(k)=0;
            bb=bb+1;
            elimina=elimina+1;
        end
    end
    xPhys=xnew;
   
    %% PASIVOS Y ACTIVOS
    xnew(passive==1) = 0;
    xnew(passive==2) = 1;
    %%
    %if ft==2 && mod(loop,2),   eval(DEN); xnew=double(xnew>0.5);,end
    xPhysA=xnew.*design;
    eval(nxPhys)
    %%
    ER=ER+ERR;
    IR=max(0,IR-IRR);
    change = abs(c-cant)/cant;
    x = xnew;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f ch.:%7.3f t.:%7.3f\n',loop,c, mean(xPhys(:)),change,tfem2);
    fprintf(' Elimina.:%7.3f Añade.:%7.3f\n',elimina/ne*100,anade/ne*100);
    %% PLOT DENSITIES
    mxPhysA=sum(sum(xPhysA))/neA;
    if displayflag==1;topUSB_h_graf; end
    
end



   