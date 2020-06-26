disp('topUSB_Results')
%% GRAFICA DE ESFUERZOS DE VON MISES
%%%%%%%%%%%%%%%%%%%%%%
if DEFORMADA==1
    xx=xf;yy=yf;
    XX=XF;
    YY=-YF;
    XXC=xc(:)-AMPLIF*ux(:);
    YYC=-yc(:)+AMPLIF*uy(:);
else
    xx=xe;yy=ye;
    XX=XI;
    YY=-YI;
    XXC=xc(:);
    YYC=-yc(:);
    
end

tic
figure('Color',[1 1 1])
fname='Esfuerzo Von Mises';
cc=esfv;imagesc(cc);
colormap(jet); colorbar;daspect([1 1 1]);
title({strcat(fname,num2str(loop));...
    strcat('min=',num2str(min(cc(:))));...
    strcat('mean=',num2str(mean(cc(:))));...
    strcat('max=',num2str(max(cc(:))))},'FontSize',10);


set(0,'DefaultFigureWindowStyle','Normal')
%
if RESULTADOS==1
    %%
  
    %%
    gg=figure('Name','Simulation Plot Window','outerposition',[0 0 1 1],'visible','on','Color',[1 1 1]);
    
    set(0, 'currentfigure',gg);
    set(0,'DefaultFigureWindowStyle','docked')
    %%
    fname='energia';cc=ce;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='U X';cc=ux;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='U Y';cc=uy;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Desplazamiento total';cc=desT;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Esfuerzos X';cc=esfx;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Esfuerzos Y';cc=esfy;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Esfuerzos XY';cc=txy;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Deformacion X';cc=defx;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Deformacion Y';cc=defy;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Deformacion XY';cc=defxy;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    
    %%  GRAFICA DESV DE ESFUERZO DE VONMISES ENTRE LOS ELEMENTOS EN CONTACTO
    %% PREPARE FILTER
    R=1.01;
    iH = ones(nelx*nely*(2*(ceil(R)-1)+1)^2,1);
    jH = ones(size(iH));
    sH = zeros(size(iH));
    k = 0;
    for i1 = 1:nelx
        for j1 = 1:nely
            el = (i1-1)*nely+j1;
            for i2 = max(i1-(ceil(R)-1),1):min(i1+( ceil(R)-1),nelx)
                for j2 = max(j1-(ceil(R)-1),1):min(j1+( ceil(R)-1),nely)
                    e2 = (i2-1)*nely+j2;
                    k = k+1;
                    
                    iH(k) = el;
                    jH(k) = e2;
                    sH(k) = max(0,R-sqrt((i1-i2)^2+(j1-j2)^2));
                end
            end
        end
    end
    
    H1 = sparse(iH,jH,sH);
    H1s = sum(H1,2);
    
    svError=esfv;
    svError(:)=(H1*esfv(:))./H1s;
    for i=1:ne
        svError(i) =abs(esfv(i)- svError(i));
    end
    fname='Error';cc=svError; figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    fname='Esfuerzo Von Mises';cc=esfv;figure('Name',fname,'Color',[1 1 1]);topUSB_h_graf3
    
end

%% ESTRUCTURA INDEFORMADA
%%%%%%%%%%%%%%%%%%%%%%
if ELEMENTOS==1
    figure('Name','Estructura');
    topUSB_struct
end
set(0,'DefaultFigureWindowStyle','normal')
toc