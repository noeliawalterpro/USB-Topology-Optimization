%% bone
CASO='X-rays-of-leg-bones';
sizeImg=strcat(num2str(nelx),'x',num2str(nely));
%img1=imread(strcat(CASO,sizeImg,'_implant.png'));
img2=imread(strcat(CASO,'_',sizeImg,'_b_solid.png'));
img3=imread(strcat(CASO,'_',sizeImg,'_fix.png'));
img4=imread(strcat(CASO,'_',sizeImg,'_fy.png'));
img6=imread(strcat(CASO,'_',sizeImg,'_b.png'));
%img5=imread(strcat(CASO,sizeImg,'_loadx.png'));


%% binary conversion

%% IMPLANTE BW
%binary_imp=convert2gray(img1);
%binary_imp=1-binary_imp;
%[binary_imp] = imgresize(binary_imp,m*f,n*f);

%% BONE BW
binary_b=convert2gray(img2);
%[binary_b2] = imgresize(binary_b2,m*f,n*f);
binary_b2=convert2gray(img6);

%[binary_b] = imgresize(binary_b,m*f,n*f);
%binary_b=(binary_imp)-(binary_b);
binary_b=binary_b>0;
%% COND BORDE FIJA
binary_fix=convert2gray(img3);
binary_fix=1-binary_fix;
%[binary_fix] = imgresize(binary_fix,m*2,n*2);
gdlL=[1:8];
L_fixed_topUSB

%% COND BORDE FIJA X
% binary_fixX=convert2gray(img3);
% binary_fixX=1-binary_fixX;
%
% topUSB_fixed_X

%% COND BORDE FIJA Y
% binary_fixY=convert2gray(img3);
% binary_fixY=1-binary_fixY;
%
% topUSB_fixed_Y

%% CARGA EN Y
binary_loadi=1-convert2gray(img4);

% Grados de libertad en y
% (8)_____________(6)
%    |            |
%    |            |
%    |            |
% (2)|____________|(4)
gdlL=[2,4,6,8];
Loadi=-500;
L_f_topUSB


%design=1-binary_imp;
design=1-binary_b;  % solido
%m2=binary_b2.*binary_b; % con escala de grises



