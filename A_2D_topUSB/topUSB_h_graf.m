disp('topUSB_h_graf')
%% PLOT esfuerzos
set(0, 'currentfigure',hh);
%set(hh, 'visible','on');
%set(hh,'units','normalized','outerposition',[0 0 1 1 ])
%set(0,'DefaultFigureWindowStyle','normal')

if loop==1
    grafh=figure('name','grafh');
    grafg=figure('name','grafg');
    pos1=get(gcf,'position');
    set(grafg,'position',pos1-[pos1(3)/2,0,0,0])
    set(grafh,'position',pos1+[pos1(3)/2,0,0,0])
end
topUSB_h_xxyy
if displaycol==2
  %% Grafica de esfuerzos
 
else
  h=subplot(1,1,1);
end

if GRAF_D==0
   set(0, 'currentfigure',grafh);
 clf(grafh)
  fname='Densidad';cc=esfv;topUSB_h_graf3    
  title({[strcat('Esfuerzo Von Mises=',num2str(loop))];...
  strcat('ne=',num2str(nelx*nely));...
  strcat('nx=',num2str(nelx),'-ny=',num2str(nely));...
  strcat('penal=',num2str(penal));...
  strcat('rmin=',num2str(rmin));...
  strcat('ft=',num2str(ft))},'FontSize',10);
end
%% Grafica de desidades
if GRAF_D==1
   set(0, 'currentfigure',grafh);
 clf(grafh)
  
  fname='Densidad';cc=xPhys;topUSB_h_graf3
  %    if GRAF_ViewDesign==1
  %    else
  set(gca,'CLim',[0 1])
  %    end
  colormap(1-gray);
  
  % colormap(1-[0 0 0; 0.25 0.25 0.25; 0.5 0.5 0.5; 0.75 0.75 0.75; 1 1 1]);
  title({[strcat('Densidad=',num2str(loop))];...
  strcat('ne=',num2str(nelx*nely));...
  strcat('nx=',num2str(nelx),'-ny=',num2str(nely));...
  strcat('penal=',num2str(penal));...
  strcat('rmin=',num2str(rmin));...
  strcat('ft=',num2str(ft))},'FontSize',10);    
end
if displaycol==2
  %% PLOT F obj y volumen
    set(0, 'currentfigure',grafg);
 
  loops=loopi:loop;
  volloop(loop)=mxPhysA;
  ch(loop)=c;
hAx= plotyy(loops,ch(loops),loops,volloop(loops));
  if METODO==400
    nmetodo=strcat(Metodo1,'_',Metodo2);
  end
  
  
  %hLine1.LineStyle = '-';
  %hLine2.LineStyle = '-.';
  %hLine2.Color=[.8 .6 .2];
  %hLine1.Color=[.3 .7 1];
  xlabel({'Iteración'},'FontSize',15);
  ylabel(hAx(1),'Función Objetivo','FontSize',15) % left y-axis
  ylabel(hAx(2),'Fracción de Volumen','FontSize',15) % right y-axis
  
  title({regexprep(CASO,'_',' ');...
  regexprep(nmetodo,'_',' ');})

disp({'Convergencia de Optimizacion';...
  regexprep(nproblema,'_',' ');...
  strcat('Porosidad=',num2str(xPor*100),'%','Volumen=',num2str(mxPhysA));...
  strcat('Funcion Objetivo =',num2str(ch(loop)))})
end
pause(1e-6)
%% EXPORTAR IMAGENES
if IMAGENES>1 && mod(loop,iter)
  tic
  name=strcat(nmetodo,num2str(loop), '.png');
  
  if IMAGENES==1
    topUSB_h_GIF_graf
  end
  if IMAGENES==2
    screencapture('handle',gcf, 'target',name)
  end
  if IMAGENES==3
    saveas(hh,name)  %18s
  end
  if IMAGENES==4
    hgx(name)     %14s
  end
  toc
end
