    %%%%%%%%%%%%%%%%%%%%%%
    Directory='mbb\';
    CASO='mbb_big';
    %%%%%%%%%%%%%%%%%%%%%%%
    %%% Lectura de Imagen
    sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));
    
    %% binary conversion 
    % IMPLANTE BW
    img1=imread(strcat(Directory,CASO,'_',sizeImg,'_design.png'));
    [img1] = img_resize(img1,Scale);%% RESIZE
    binary_imp=(convert2gray(img1))>0;    
    design=(1-binary_imp);
    mV=(1-design);
    %% COND BORDE FIJA
    img3=imread(strcat(Directory,CASO,'_',sizeImg,'_sx.png'));
    [img3] = img_resize(img3,Scale);  %% RESIZE
    binary_fix=(1-convert2gray(img3))>0;
    %figure;imagesc(1-binary_fix);daspect([1,1,1]);title('FIJO');colormap('bone');colorbar;
    gdlL=[1,7];
    L_fixed_topUSB
    %% sy
    img4=imread(strcat(Directory,CASO,'_',sizeImg,'_sy.png'));
    [img4] = img_resize(img4,Scale);  %% RESIZE
    binary_fix=(1-convert2gray(img4))>0;
    %figure;imagesc(1-binary_fix);daspect([1,1,1]);title('FIJO');colormap('bone');colorbar;
    gdlL=[4];
    L_fixed_topUSB
    %% CARGA EN Y
    %% Grados de libertad en y   % Grados de libertad en x
    %[2,4,6,8];             [1,3,5,7];
    % (8)___________(6)  % (7)___________(5)
    %    |          |    %    |          |
    %    |          |    %    |          |
    %    |          |    %    |          |
    % (2)|__________|(4) % (1)|__________|(3)
    %% TENDON
    img8=imread(strcat(Directory,CASO,'_',sizeImg,'_fy.png'));
    [img8] = img_resize(img8,Scale);  %% RESIZE                       %% RESIZE  
    %%Tendon fy
    binary_loadi=(1-convert2gray(img8))>0;
    %figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('Tendon fy');colormap('bone');colorbar;
    gdlL=[4];
    Loadi=fy;
    L_f_topUSB
%% E[MPa]
%%%%%%%%%%%%%%%%%%%%%%
%% MATERIAL VACIO
EMat(1)=Emin;
nuMat(1)=nu;
SyMat(1)=Sy0;
mesh(:,1)=mV(:);
%% ANDAMIO
EMat(2)=E0;
nuMat(2)=nu;
SyMat(2)=Sy0;
mesh(:,2)=design(:);