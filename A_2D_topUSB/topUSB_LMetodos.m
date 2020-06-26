%% METODO PUROS
% %   0 FEM
% % 300 METODO PURO
% % 400 METODO COMBINADO
% %  NO 99 FEMortho
% %  NO 88 Remodelado
% % 100 FEMconv
disp('topUSB_LMetodos')
neA=sum(design(:));
%% METODOS PUROS
if METODO==0;
    nmetodo='topUSB FEM+';
    disp(nmetodo)
    eval(nxPhys)
    xPhysA=design;
    xini=xPhys;
    cant=0;   c=100;
    eval(nfem)
    topUSB_Results
else
    v=volfrac;
end
if METODO==99;
    nmetodo='topUSB FEMortho+';
    disp(nmetodo)
    eval(nxPhys)
    xini=xPhys;
    cant=0;    c=100;
    topUSB_2D_fem_orthotropic
end


if METODO==88;
    nmetodo='Remodelado+';
    
    eval(nxPhys)
    xini=xPhys;
    disp(nmetodo)
    cant=0;
    c=100;
    m1=design;
    M88_RO_topUSB
end
%% METODO PURO
if METODO==300;
    loopi=1;
    set(0,'DefaultFigureWindowStyle','normal')
    hh =figure('units','normalized','outerposition',[0 0 1 1],'visible','off','Color',[1 1 1]);
    
    nmetodo=Metodo1;
    if IMAGENES==1
        nmetodo =strcat(nmetodo, input(nmetodo,'s'));
    end
    tic
    eval(PREF)  %% FILTER
    toc
    pmax=penal;
    
    disp(Metodo1)
    eval(Metodo1)
    
    if displayflag==1
        disp({regexprep(CASO,'_',' ');...
            regexprep(nmetodo,'_',' ');...
            'Convergencia de Optimizacion';...
            regexprep(nproblema,'_',' ');...
            strcat('Porosidad=',num2str(xPor*100),'%');
            strcat('Volumen=',num2str(volloop(loop)));...
            strcat('Funcion Objetivo =',num2str(ch(loop)))})
    end
    
end
%% METODO COMBINADO
if METODO==400;
    set(0,'DefaultFigureWindowStyle','normal')
    hh =figure('units','normalized','outerposition',[0 0 1 1],'visible','off','Color',[1 1 1]);
    
    nmetodo=strcat(Metodo1,'_',Metodo2);
    if IMAGENES==1
        nmetodo =strcat(nmetodo, input(nmetodo,'s'));
    end
    volfrac=v+(1-v)*F1;
    %% METODO
    loopi=1;
    nmetodo=Metodo1;
    disp(Metodo1)
    penal=penal1;
    tolx=tolx1;
    rmin=rmin1;
    ft=ft1;
    ERR=er1;
    er=er1;
    IRR=er1;
    pmax=penal;
    maxloop=maxloop1;
    
    eval(PREF)   %% FILTER
    eval(Metodo1)
    
    design=xPhysA>0.1;
    jj=hh;
    %% METODO 2
     loopi=loop;
    hh =figure('units','normalized','outerposition',[0 0 1 1],'visible','off','Color',[1 1 1]);
    
    nmetodo=Metodo2;
    disp(Metodo2)
    penal=penal2;
    tolx=tolx2;
    rmin=rmin2;
    ft=ft2;
    ERR=er2;
    er=er2
    IRR=er2;
    
    pmax=penal;
    maxloop=maxloop2;
    volfrac=v;
    eval(PREF)   %% FILTER
    eval(Metodo2)
    if displayflag==1
        disp({regexprep(CASO,'_',' ');...
            regexprep(nmetodo,'_',' ');...
            'Convergencia de Optimizacion';...
            regexprep(nproblema,'_',' ');...
            strcat('Porosidad=',num2str(xPor*100),'%');
            strcat('Volumen=',num2str(volloop(loop)));...
            strcat('Funcion Objetivo =',num2str(ch(loop)))})
    end
    
end
if METODO~=0 && METODO~=100 && displayflag==1
    set(hh, 'Color',0.9*[1 1 1])
end

%clear Metodo1 Metodo2  penal  tolx rmin ft  er maxloop pmax volfrac
%% TIEMPOS
%tElapsedB
tElapsedcpu_M = cputime-tcpu_M;
tElapsedMetodo = toc(tStartM);

