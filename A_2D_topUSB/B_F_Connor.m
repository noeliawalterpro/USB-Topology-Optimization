 
clear mesh
%% PROPIEDADES DEL MATERIAL
    %% E[MPa]
    %%%%%%%%%%%%%%%%%%%%%%
    %% MATERIAL VACIO
    EMat(1)=16E3*1E-9;
    nuMat(1)=0.3;
    SyMat(1)=Sy0;
    mesh(:,1)=(1-mB(:)).*(1-design(:));
    %% CORTICAL
    EMat(2)=16E3;
    nuMat(2)=0.3;
    SyMat(2)=SyBc;
    mesh(:,2)=mBc(:);
    %% ESPONJOSO
    EMat(3)=2E3;
    nuMat(3)=0.3;
    SyMat(3)=SyBe;
    mesh(:,3)= mBe(:);
    set(0,'DefaultFigureWindowStyle','normal')
    %%%%%%%%%%%%%%%%%%%
    textMat={'Vacio','Cortical','Esponjoso'};
  
if MALLADO==1 || MALLADO==3
    %% COND BORDE FIJA
    img3=imread(strcat(Directory,CASO,'_',sizeImg,'_soporte.png'));    %% Lectura de Imagen
    [img3] = img_resize(img3,Scale);
    binary_fix=(1-convert2gray(img3)).*mB;
    %figure;imagesc(1-binary_fix);daspect([1,1,1]);title('FIJO');colormap('bone');colorbar;
    gdlL=[1:8];
    L_fixed_topUSB
    %% CARGA EN Y
    %%Cadera
    img4=imread(strcat(Directory,CASO,'_',sizeImg,'_cadera.png'));     %% Lectura de Imagen
    [img4] = img_resize(img4,Scale);                          %% RESIZE
    binary_loadi=(1-convert2gray(img4));
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Cadera');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=Caderay;
    L_f_topUSB
    %%Cadera x
    gdlL=[1,3,5,7];
    Loadi=Caderax;
    L_f_topUSB
    %% TENDON
    img8=imread(strcat(Directory,CASO,'_',sizeImg,'_tendon.png'));     %% Lectura de Imagen
    [img8] = img_resize(img8,Scale);                         %% RESIZE
    %%Tendon fy
    binary_loadi=(1-convert2gray(img8)).*mB;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=Tendony;
    L_f_topUSB
    %%Tendon fx
    gdlL=[1,3,5,7];
    Loadi=Tendonx;
    L_f_topUSB
end