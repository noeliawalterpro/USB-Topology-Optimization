

if MALLADO==0 || MALLADO==3
    %%%%%%%%%%%%%%%%%%%%%%
    CASO='connor';
    %%%%%%%%%%%%%%%%%%%%%%% 
    sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));
    
    img9=imread(strcat(CASO,'_',sizeImg,'_graf1.png'));%% Lectura de Imagen
    [img9] = img_resize(img9,Scale);%% RESIZE
    %% binary conversion
    
    %% IMPLANTE BW
    img1=imread(strcat(CASO,'_',sizeImg,'_implante.png'));%% Lectura de Imagen
    [img1] = img_resize(img1,Scale);%% RESIZE
    binary_imp=convert2gray(img1);
    binary_imp=(1-binary_imp)>0;
    %% HUESO
    img2=imread(strcat(CASO,'_',sizeImg,'_bone.png'));%% Lectura de Imagen
    [img2] = img_resize(img2,Scale);%% RESIZE
    binary_b=convert2gray(img2)>0;
    %binary_b=(binary_imp)+(binary_b);
    binary_b=binary_b>0;
    %% CORTICAL
    img6=imread(strcat(CASO,'_',sizeImg,'_cortical.png'));%% Lectura de Imagen
    [img6] = img_resize(img6,Scale);%% RESIZE
    binary_C=convert2gray(img6)>0;
    %binary_C=(binary_imp)+(binary_C);
    binary_C=binary_C>0;
    %% ESPONJOSO
    %     img7=imread(strcat(CASO,'_',sizeImg,'_esponjoso.png'));%% Lectura de Imagen
    %     [img7] = img_resize(img7,Scale);%% RESIZE
    %     binary_E=convert2gray(img7)>0;
    %     %binary_E=(binary_imp)+(binary_E);
    %     binary_E=binary_E>0;
    %% DEFINICION DE MATERIALES
    % design=(binary_imp)>0;
    mB=1-binary_b>0;  % Material Oseo
    design=mB;
    mBc=((1-binary_C)).*mB; % Material Oseo Cortical
    mBc=mBc>0;
    %mBe=(1-binary_E);
    mBe=mB.*(mB-mBc); % Material Oseo esponjoso
    mBe=mBe>0;
    % m2=binary_b2.*binary_b; % con escala de grises
    graf1=convert2gray(img9)>0;
    mV=1-mBe-mBc-;
end

B_F_Connor
A_Mat_F2_Connor