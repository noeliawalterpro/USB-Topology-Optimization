%% bone
CASO='X-rays-of-leg-bones';
sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));
img1=imread(strcat(CASO,'_',sizeImg,'_implant.png'));
img2=imread(strcat(CASO,'_',sizeImg,'_b_solid.png'));
img3=imread(strcat(CASO,'_',sizeImg,'_fix.png'));
img4=imread(strcat(CASO,'_',sizeImg,'_fy.png'));
img6=imread(strcat(CASO,'_',sizeImg,'_b.png'));
%img5=imread(strcat(CASO,sizeImg,'_loadx.png'));
%% RESIZE
[img1] = img_resize(img1,Scale);
[img2] = img_resize(img2,Scale);
[img3] = img_resize(img3,Scale);
[img4] = img_resize(img4,Scale);
[img6] = img_resize(img6,Scale);

%% binary conversion

%% IMPLANTE BW
binary_imp=convert2gray(img1);
binary_imp=(1-binary_imp)>0;

%% BONE BW
binary_b=convert2gray(img2);
binary_b2=convert2gray(img6);

binary_b=(binary_imp)-(binary_b);
binary_b=binary_b>0;
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
design=(1-binary_imp)>0;
m1=binary_b>0;  % solido
m2=binary_b2.*binary_b; % con escala de grises



