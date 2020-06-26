CASO='X-rays-of-leg-bones';
if MALLADO==0 || MALLADO==3
    %% bone
    
    sizeImg=strcat(num2str(nelx),'x',num2str(nely));
    img1=imread(strcat(CASO,'_',sizeImg,'_implant.png'));
    img2=imread(strcat(CASO,'_',sizeImg,'_b_solid.png'));
    img3=imread(strcat(CASO,'_',sizeImg,'_fix.png'));
    img4=imread(strcat(CASO,'_',sizeImg,'_fy.png'));
    img6=imread(strcat(CASO,'_',sizeImg,'_b.png'));
    %img5=imread(strcat(CASO,sizeImg,'_loadx.png'));
    
    
    %% IMPLANTE BW
    binary_imp=convert2gray(img1);
    binary_imp=1-binary_imp;
    
    %% BONE BW
    binary_b=convert2gray(img2);
    binary_b2=convert2gray(img6);
    
    binary_b=(binary_imp)-(binary_b);
    binary_b=binary_b>0;
    
    
    design=1-binary_imp;
    mBc=binary_b;  % solido
    mB=binary_b;
    mBgrises=binary_b2.*binary_b; % con escala de grises
    %%
end
if MALLADO==1 || MALLADO==3
    %% COND BORDE FIJA
    binary_fix=convert2gray(img3);
    binary_fix=1-binary_fix;
    gdlL=[1:8];
    L_fixed_topUSB
    
    %% CARGA EN Y
    binary_loadi=1-convert2gray(img4);
    % Grados de libertad en y
    % (8)_____________(6)
    %    |            |
    %    |            |
    %    |            |
    % (2)|____________|(4)
    gdlL=[2,4,6,8];
    Loadi=-1;
    L_f_topUSB
    
    %%
end
