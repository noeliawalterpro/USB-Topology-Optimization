 
if MALLADO==1 || MALLADO==3
    %% COND BORDE FIJA
    img3=imread(strcat(CASO,'_',sizeImg,'_soporte.png'));
    [img3] = img_resize(img3,Scale);  %% RESIZE
    binary_fix=(1-convert2gray(img3));
    %figure;imagesc(1-binary_fix);daspect([1,1,1]);title('FIJO');colormap('bone');colorbar;
    gdlL=[1:8];
    L_fixed_topUSB
    %% CARGA EN Y
    %% Grados de libertad en y   % Grados de libertad en x
    % (8)_____________(6)       % (7)_____________(5)
    %    |            |         %    |            |
    %    |            |         %    |            |
    %    |            |         %    |            |
    % (2)|____________|(4)      % (1)|____________|(3)
    %% Cadera
    img4=imread(strcat(CASO,'_',sizeImg,'_cadera2.png'));
    [img4] = img_resize(img4,Scale);  %% RESIZE
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
    img8=imread(strcat(CASO,'_',sizeImg,'_tendon.png'));
    [img8] = img_resize(img8,Scale);  %% RESIZE                       %% RESIZE  
    %%Tendon fy
    binary_loadi=(1-convert2gray(img8));
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=Tendony;
    L_f_topUSB
    %%Tendon fx
    binary_loadi=(1-convert2gray(img8));
    gdlL=[1,3,5,7];
    Loadi=Tendonx;
    L_f_topUSB
    %%
end