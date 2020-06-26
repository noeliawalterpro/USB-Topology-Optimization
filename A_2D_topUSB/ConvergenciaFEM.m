disp('ConvergenciaFEM')
esfPC=[];
nxx=nelx;
nyy=nely;
lxx=lx;
nmetodo='topUSB FEMconv';
FUNnew=100;
RESULTADOS=0;
FUNPC=0;
kkk=0;
change=100;
METODO=Met;

% while abs(esfnew-esfPC(kkk))>1e-4
while change>1|| kkk<4
    kkk=kkk+1;
    tic
    Scale=kkk
    
    nelx=nxx*Scale; nely=nyy*Scale;  paso=lx/(nelx);
    pcontrol=zeros(nely,nelx);
    eval(nPC)
    pcontrol(xci,yci)=1;
    pc= find(pcontrol==1);
    disp('Metodo listo')
    A_2D_topUSB
    pAPDL(kkk)= nelem(pc);
    %%
    FUNPC(kkk)=esfv(pc);
    %%
    nn(kkk)=nelx*nely;
    Nn(kkk)=Scale;
    pasok(kkk)=paso;
    tiempok(kkk)=toc;
    change=abs((FUNnew-FUNPC(kkk)))/FUNnew
    FUNnew=FUNPC(kkk);
    ch(kkk)=change*100;
end

pasok
pAPDL
nn
FUNPC
tiempok
RESULTADOS=1;
topUSB_Results
set(0,'DefaultFigureWindowStyle','Normal')
figure('visible','on','Color',[1 1 1]);
plot(nn,FUNPC,'-o');
ch
paso
title({regexprep(nproblema,'_',' '),'Convergencia'});
xlabel({'Nro de Elementos'});
ylabel({'Svm Punto de Control'}) % left y-axis