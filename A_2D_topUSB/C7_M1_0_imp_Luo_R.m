
if MALLADO==0 || MALLADO==3
    Directory='mandible/';
    CASO='madible';
    %%%%%%%%%%%%%%%%%%%%%%%
    %%% Lectura de Imagen
    sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));
    %% MATERIALES
    %% IMPLANTE BW
    img1=imread(strcat(Directory,CASO,'_',sizeImg,'_implante.png'));
    [img1] = img_resize(img1,Scale);%% RESIZE
    binary_imp=convert2gray(img1);
    binary_imp=(1-binary_imp)>0;
    %% HUESO
    img2=imread(strcat(Directory,CASO,'_',sizeImg,'_mB.png'));
    [img2] = img_resize(img2,Scale);%% RESIZE
    binary_b=convert2gray(img2)>0;
    binary_b=(binary_imp)+(binary_b);
    binary_b=binary_b>0;
    %% CORTICAL
    img6=imread(strcat(Directory,CASO,'_',sizeImg,'_mC.png'));
    [img6] = img_resize(img6,Scale);%% RESIZE
    binary_C=convert2gray(img6)>0;
    binary_C=(binary_imp)+(binary_C);
    binary_C=binary_C>0;
    %% ESPONJOSO
    %      img7=imread(strcat(Directory,CASO,'_',sizeImg,'_Dientes.png'));
    %     [img7] = img_resize(img7,Scale);%% RESIZE
    %
    %     binary_E=convert2gray(img7)>0;
    %     binary_E=(binary_imp)+(binary_E);
    %     binary_E=binary_E>0;
    %% DEFINICION DE MATERIALES
    design=(binary_imp)>0;
    
    mB=1-binary_b>0;  % Material Oseo
    %     design=mB;
    minImp=(1-convert2gray(img2)>0).*design;
    mBc=(1-binary_C); % Material Oseo Cortical
    mBc=mBc>0;
    %mBe=(1-binary_E);
    mBe=mB.*(mB-mBc); % Material Oseo esponjoso
    mBe=mBe>0;
    
    mV=1-mBe-mBc-design;
    % m2=binary_b2.*binary_b; % con escala de grises
    
    %     set(0,'DefaultFigureWindowStyle','docked')
    %     figure;imagesc(1-design);daspect([1,1,1]);title('desing');colormap('bone');colorbar;
    
    set(0,'DefaultFigureWindowStyle','normal')
    %  volfrac=sum(sum(minImp))/sum(sum(design));
end
A_G_M_Luo
B_M_Luo