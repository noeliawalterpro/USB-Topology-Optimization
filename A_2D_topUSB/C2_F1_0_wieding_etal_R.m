

if MALLADO==0 || MALLADO==3
    %% bone
    %%%%%%%%%
    %% Hounfield a partir de DICOM
    HUmax=2565;
    HUmin=787;
    %%
    %% miguel cerrolaza
    %     dmax=1.9; %g/cmm3  cortical
    %     dmin=0.14;%g/cmm3  esponjoso 0.14 to 1.10
    %%%%%%%%%%%%%%%%%%%%%%
    Directory='connor\';
    CASO='connor';
    %%%%%%%%%%%%%%%%%%%%%%%
    %%% Lectura de Imagen
    sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));
    
    %% binary conversion
    
    % IMPLANTE BW
    img1=imread(strcat(Directory,CASO,'_',sizeImg,'_implante.png'));
    [img1] = img_resize(img1,Scale);%% RESIZE
    binary_imp=convert2gray(img1);
    binary_imp=(1-binary_imp)>0;
    
    % PLACA TORNILLO
    img10=imread(strcat(Directory,CASO,'_',sizeImg,'_tornillos_placa.png'));
    [img10] = img_resize(img10,Scale);%% RESIZE
    binary_pt=1-convert2gray(img10)>0;
    
    % HUESO
    img2=imread(strcat(Directory,CASO,'_',sizeImg,'_bone.png'));
    [img2] = img_resize(img2,Scale);%% RESIZE
    binary_b=convert2gray(img2)>0;
    binary_b=(binary_imp)+(binary_b);
    binary_b=(binary_b>0);
    
    % CORTICAL
    img6=imread(strcat(Directory,CASO,'_',sizeImg,'_cortical.png'));
    [img6] = img_resize(img6,Scale);%% RESIZE
    binary_C=convert2gray(img6)>0;
    binary_C=(binary_imp)+(binary_C);
    binary_C=binary_C>0;
    % ESPONJOS
    %     img7=imread(strcat(Directory,CASO,'_',sizeImg,'_esponjoso.png'));
    %     [img7] = img_resize(img7,Scale);%% RESIZE
    %% DEFINICION DE MATERIALES
    design=(binary_imp)>0;
    
    mB=1-binary_b>0;  % Material Oseo
    % design=mB;
    minimp=(1-convert2gray(img2)>0).*design;
    %% MIN IMP C
     %% IMPLANTE C
    img11=imread(strcat(Directory,CASO,'_',sizeImg,'_impc.png'));
    [img11] = img_resize(img11,Scale);%% RESIZE
    binary_impc=convert2gray(img11);
    minimp=1-binary_impc;
    
    mBc=(1-binary_C); % Material Oseo Cortical
    mBc=mBc>0;
    %mBe=(1-binary_E);
    mBe=mB.*(mB-mBc); % Material Oseo esponjoso
    mBe=mBe>0;
    mpt=binary_pt;
    mB=(mBe+mBc).*(1-mpt);
    mBc=mBc.*(1-mpt);
    mBe=mBe.*(1-mpt); 
    mV=(1-mBc-mBe).*(1-design).*(1-mpt);
   volfrac=sum( minimp(:))/sum(design(:)); 
end

B_F_wieding
A_Mat_F1_wieding
