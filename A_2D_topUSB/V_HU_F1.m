close all
Scale=1;
A_G_F_wieding
sizeImg=strcat(num2str(nelx/Scale),'x',num2str(nely/Scale));

%%%%%%%%%
%% Hounfield a partir de DICOM
HUmax=2565;
HUmin=787;
%%
%% miguel cerrolaza
dmax=1.9; %g/cmm3  cortical
dmin=0.14;%g/cmm3  esponjoso 0.14 to 1.10
%%%%%%%%%%%%%%%%%%%%%%
%% IMAGENES EXTRAIDAS DEL VHP FEMENINO
CASO ='connor';
img11=imread(strcat(CASO,'_',sizeImg,'_dicom.png'));%% Lectura de Imagen
%   %  [img11] = img_resize(img11,Scale);%% RESIZE
%     mDICOM=convert2gray(img11);
%     mDICOM=mDICOM.*(1-mpt);
%     %% CONVERSION HU
%     [xDICOM]= HU2DEN(mDICOM,HUmin,HUmax,Dmin,Dmax);
img2=imread(strcat(CASO,'_',sizeImg,'_bone.png'));
%    [img2] = img_resize(img2,Scale);%% RESIZE
binary_b=convert2gray(img2)>0;
%    binary_b=(binary_imp)+(binary_b);
binary_b=(binary_b>0);
mB=(1- binary_b);
%%%%%%%%%%%%%%%%%%%%%%
%% BINARY
img11=convert2gray(img11);

%%%%%%%%%%%%%%%%%%%%
%% COVERSION A HOUNFIELD
img1=img11;
x1=max(img1(:));
x2=min(img1(:));
%
a1=(HUmin-HUmax)/(x2-x1);
b2=HUmin-a1*x2;
img1=(img1)*a1+b2;
BHU=img1;
%
a1=(dmin-dmax)/(HUmin-HUmax);
b2=dmin-a1*HUmin;
DHU=(BHU)*a1+b2;
%% ELIMINAR MATERIAL NO OSEO
DHU=DHU.*mB;
%%%%%%%%%%%%%%%%%%%%
%  [img11] = img_resize(img11,Scale);%% RESIZE
mDICOM=convert2gray(img11);
mDICOM=mDICOM;
%% CONVERSION HU
[BHU, DHU]= HU2DEN(mDICOM,HUmin,HUmax,Dmin,Dmax);

%% GRAFICAS
figure;imagesc(BHU);daspect([1,1,1]);title('BHU');colormap('bone');colorbar;
figure;imagesc(DHU);daspect([1,1,1]);title('DHU');colormap('bone');colorbar;