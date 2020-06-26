
%% PROPIEDADES DEL MATERIAL
%% E[MPa]
HU=0;
%% IMPLANTE
nu=0.3;E0=16000;
Emin=E0*1e-9;%% MATERIAL VACIO
Sy0=1;
%% (OSEO)PROPIEDADES DEL MATERIAL
%% CORTICAL
nuBc=0.3;
EBc=13700.; %% CORTICAL
SyBc=1;
%% ESPONJOSO
nuBe=0.34;
EBe=17600.; %% DIENTE
SyBe=1;
%% Material MAT
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
%% CORTICAL
EMat(3)=EBc;
nuMat(3)=nuBc;
SyMat(3)=SyBc;
mesh(:,3)=mBc(:);
%%
EMat(4)=EBe;
nuMat(4)=nuBe;
SyMat(4)=SyBe;
mesh(:,4)=mBe(:);

textMat={'Vacio','Andamio Inicial','Cortical','Diente'};






if MALLADO==1 || MALLADO==3
    %% COND BORDE FIJA
    img3=imread(strcat(Directory,CASO,'_',sizeImg,'_soporte.png'));
    [img3] = img_resize(img3,Scale);%% RESIZE
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
    % X [1,3,5,7];
    % Y [2,4,6,8];
    %% INC
    img4=imread(strcat(Directory,CASO,'_',sizeImg,'_INC.png'));
    [img4] = img_resize(img4,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img4));
    % figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('INC');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=INCy;
    L_f_topUSB
    %%INC x
    gdlL=[1,3,5,7];
    Loadi=INCx;
    L_f_topUSB
    %% PT fy
    img8=imread(strcat(Directory,CASO,'_',sizeImg,'_PT.png'));
    [img8] = img_resize(img8,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img8));
    %  figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('PT');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=PTy;
    L_f_topUSB
    %%PT fx
    gdlL=[1,3,5,7];
    Loadi=PTx;
    L_f_topUSB
    %%
    %% MT fy
    img9=imread(strcat(Directory,CASO,'_',sizeImg,'_MT.png'));
    [img9] = img_resize(img9,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img9));
    %   figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('MT');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=MTy;
    L_f_topUSB
    %%MT fx
    gdlL=[1,3,5,7];
    Loadi=MTx;
    L_f_topUSB
    %%
    %% AD
    img10=imread(strcat(Directory,CASO,'_',sizeImg,'_AD.png'));
    [img10] = img_resize(img10,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img10));
    %  figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('AD');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=ADy;
    L_f_topUSB
    %%AD fx
    gdlL=[1,3,5,7];
    Loadi=ADx;
    L_f_topUSB
    %%
    %% AT fy
    img11=imread(strcat(Directory,CASO,'_',sizeImg,'_AT.png'));
    [img11] = img_resize(img11,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img11));
    %  figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('AT');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=ATy;
    L_f_topUSB
    %%AD fx
    gdlL=[1,3,5,7];
    Loadi=ATx;
    L_f_topUSB
    %%
    %% ICP fy
    img12=imread(strcat(Directory,CASO,'_',sizeImg,'_ICP.png'));
    [img12] = img_resize(img12,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img12));
    %  figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('ICP');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=ICPy;
    L_f_topUSB
    %%AD fx
    gdlL=[1,3,5,7];
    Loadi=ICPx;
    L_f_topUSB
    %%
    %% ILP_SLP
    img13=imread(strcat(Directory,CASO,'_',sizeImg,'_ILP_SLP.png'));
    [img13] = img_resize(img13,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img13));
    %  figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('ilp');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=ILP_SLPy;
    L_f_topUSB
    %%ILP_SLP fx
    
    gdlL=[1,3,5,7];
    Loadi=ILP_SLPx;
    L_f_topUSB
    %% RMOL
    img14=imread(strcat(Directory,CASO,'_',sizeImg,'_RMOL.png'));
    [img14] = img_resize(img14,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img14));
    %  figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('RMOL');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=RMOLy;
    L_f_topUSB
    %%RMOL fx
    gdlL=[1,3,5,7];
    Loadi=RMOLx;
    L_f_topUSB
    %% MP
    img15=imread(strcat(Directory,CASO,'_',sizeImg,'_MP.png'));
    [img15] = img_resize(img15,Scale);%% RESIZE
    binary_loadi=(1-convert2gray(img15));
    %  figure;imagesc(1-binary_loadi);daspect([1,1,1]);title('MP');colormap('bone');colorbar;
    gdlL=[2,4,6,8];
    Loadi=MPy;
    L_f_topUSB
    %%MP fx
    gdlL=[1,3,5,7];
    Loadi=MPx;
    L_f_topUSB
end
