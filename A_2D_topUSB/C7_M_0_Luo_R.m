

if MALLADO==0 || MALLADO==3
    %% bone
    %%%%%%%%%
    %% Hounfield a partir de DICOM
    HUmax=2565;
    HUmin=787;
    %%
    %% miguel cerrolaza
    dmax=1.9; %g/cmm3  cortical
    dmin=0.14;%g/cmm3  esponjoso 0.14 to 1.10
    %%%%%%%%%%%%%%%%%%%%%%
    CASO='madible';
    %%%%%%%%%%%%%%%%%%%%%%%
    %%% Lectura de Imagen
    sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));
    
    %% SOPORTES
    img3=imread(strcat(CASO,'_',sizeImg,'_soporte.png'));
    %% MATERIALES
    img1=imread(strcat(CASO,'_',sizeImg,'_implante.png'));
    img2=imread(strcat(CASO,'_',sizeImg,'_mB.png'));
    img6=imread(strcat(CASO,'_',sizeImg,'_mC.png'));
    img7=imread(strcat(CASO,'_',sizeImg,'_Dientes.png'));
    %% CARGAS
    img4=imread(strcat(CASO,'_',sizeImg,'_INC.png'));
    img8=imread(strcat(CASO,'_',sizeImg,'_PT.png'));
    img9=imread(strcat(CASO,'_',sizeImg,'_MT.png'));
    img10=imread(strcat(CASO,'_',sizeImg,'_AD.png'));
    img11=imread(strcat(CASO,'_',sizeImg,'_AT.png'));
    img12=imread(strcat(CASO,'_',sizeImg,'_ICP.png'));
    img13=imread(strcat(CASO,'_',sizeImg,'_ILP_SLP.png'));
    img14=imread(strcat(CASO,'_',sizeImg,'_RMOL.png'));
    img15=imread(strcat(CASO,'_',sizeImg,'_MP.png'));
    %img5=imread(strcat(CASO,sizeImg,'_loadx.png'));
    %% RESIZE
    [img1] = img_resize(img1,Scale);
    [img2] = img_resize(img2,Scale);
    [img3] = img_resize(img3,Scale);
    [img4] = img_resize(img4,Scale);
    [img6] = img_resize(img6,Scale);
    [img7] = img_resize(img7,Scale);
    [img8] = img_resize(img8,Scale);
    [img9] = img_resize(img9,Scale);
    [img10] = img_resize(img10,Scale);
    [img11] = img_resize(img11,Scale);
    [img12] = img_resize(img12,Scale);
    [img13] = img_resize(img13,Scale);
    [img14] = img_resize(img14,Scale);
    [img15] = img_resize(img15,Scale);
    %% binary conversion
    
    %% IMPLANTE BW
    binary_imp=convert2gray(img1);
    %  binary_imp=(1-binary_imp)>0;
    %% HUESO
    binary_b=convert2gray(img2)>0;
    %   binary_b=(binary_imp)+(binary_b);
    binary_b=binary_b>0;
    %% CORTICAL
    binary_C=convert2gray(img6)>0;
    %   binary_C=(binary_imp)+(binary_C);
    binary_C=binary_C>0;
  %% DEFINICION DE MATERIALES
    %    design=(binary_imp)>0;
    
    mB=1-binary_b>0;  % Material Oseo
    design=mB;
    minImp=(1-convert2gray(img2)>0).*design;
    mBc=(1-binary_C); % Material Oseo Cortical
    mBc=mBc>0;
    %mBe=(1-binary_E);
    mBe=mB.*(mB-mBc); % Material Oseo esponjoso
    mBe=mBe>0;
    % m2=binary_b2.*binary_b; % con escala de grises
    
    set(0,'DefaultFigureWindowStyle','normal')
    volfrac=sum(sum(minImp))/sum(sum(design));
end

B_M