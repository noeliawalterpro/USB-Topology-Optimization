
if MALLADO==1 || MALLADO==3
    %% CARGA EN Y
    %% Grados de libertad en y   % Grados de libertad en x
    % (8)_____________(6)       % (7)_____________(5)
    %    |            |         %    |            |
    %    |            |         %    |            |
    %    |            |         %    |            |
    % (2)|____________|(4)      % (1)|____________|(3)
    %% COND BORDE FIJA
    img3=imread(strcat(Directory,CASO,'_',sizeImg,'_soporte.png'));    %% Lectura de Imagen
    [img3] = img_resize(img3,Scale);
    %%%%%%%%%%%%%%%
    binary_fix=(1-convert2gray(img3)).*mB;
    %   gloads=binary_fix*10;
    %figure;imagesc(1-binary_fix);daspect([1,1,1]);title('FIJO');colormap('bone');colorbar;
    gdlL=[1:8];
    L_fixed_topUSB
    %% Cadera
    img4=imread(strcat(Directory,CASO,'_',sizeImg,'_cadera.png'));     %% Lectura de Imagen
    [img4] = img_resize(img4,Scale);                         %% RESIZE
    
    %%%%%%%%%%%%
    binary_loadi=(1-convert2gray(img4)).*mB;
    %   gloads=gloads+binary_loadi*2;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Cadera');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=Caderay;
    L_f_topUSB
    %%Cadera x
    binary_loadi=(1-convert2gray(img4)).*mB;
    gdlL=[1,3,5,7];
    Loadi=Caderax;
    L_f_topUSB
    %% MGLUTEI
    img8=imread(strcat(Directory,CASO,'_',sizeImg,'_tendon.png'));     %% Lectura de Imagen
    [img8] = img_resize(img8,Scale);                         %% RESIZE
    %%Tendon fy
    binary_loadi=(1-convert2gray(img8)).*mB;
    %   gloads=gloads+binary_loadi*3;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=mgluteiy;
    L_f_topUSB
    %%Tendon fx
    binary_loadi=(1-convert2gray(img8)).*mB;
    gdlL=[1,3,5,7];
    Loadi=mgluteix;
    L_f_topUSB
    %%
    %% Miliopsoas
    img6=imread(strcat(Directory,CASO,'_',sizeImg,'_miliopsoas.png')); %% Lectura de Imagen
    [img6] = img_resize(img6,Scale);                         %% RESIZE
    %% MGLUTEI
    %%Tendon fy
    binary_loadi=(1-convert2gray(img6)).*mB;
    %    gloads=gloads+binary_loadi*4;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=miliopsoasy;
    L_f_topUSB
    %%Tendon fx
    binary_loadi=(1-convert2gray(img6)).*mB;
    gdlL=[1,3,5,7];
    Loadi=miliopsoasx;
    L_f_topUSB
    %% gluteus max
    img5=imread(strcat(Directory,CASO,'_',sizeImg,'_mgluteus.png'));   %% Lectura de Imagen
    [img5] = img_resize(img5,Scale);                         %% RESIZE
    %%fy
    binary_loadi=(1-convert2gray(img5)).*mB;
    %   gloads=gloads+binary_loadi*5;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=mgluteusy;
    L_f_topUSB
    %%fx
    binary_loadi=(1-convert2gray(img5)).*mB;
    gdlL=[1,3,5,7];
    Loadi=mgluteusx;
    L_f_topUSB
    %% vastus
    img7=imread(strcat(Directory,CASO,'_',sizeImg,'_mvastus.png'));   %% Lectura de Imagen
    [img7] = img_resize(img7,Scale);                         %% RESIZE
    %%fy
    binary_loadi=(1-convert2gray(img7)).*mB;
    %  gloads=gloads+binary_loadi*6;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=mvastusy;
    L_f_topUSB
    %%fx
    binary_loadi=(1-convert2gray(img7)).*mB;
    gdlL=[1,3,5,7];
    Loadi=mvastusx;
    L_f_topUSB
    %% piriformis
    img7=imread(strcat(Directory,CASO,'_',sizeImg,'_mpiriformis.png'));   %% Lectura de Imagen
    [img7] = img_resize(img7,Scale);                         %% RESIZE
    %%fy
    binary_loadi=(1-convert2gray(img7)).*mB;
    %  gloads=gloads+binary_loadi*7;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=mpiriformisy;
    L_f_topUSB
    %%fx
    binary_loadi=(1-convert2gray(img7)).*mB;
    gdlL=[1,3,5,7];
    Loadi=mpiriformisx;
    L_f_topUSB
    %%
    %     gloads=gloads+(mBc+mBe)*10.*(1-gloads>0);
    %     imagesc(gloads)
    %     axis equal
    %     textgloads={'Soporte','cadera','m.gluteii','iliopsoas','gluteus maximun','vastus'};
end