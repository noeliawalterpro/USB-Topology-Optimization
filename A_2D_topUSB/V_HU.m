close all
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
img8=imread('Eve/Eve_Axial 0 2565+000256-001.jpg');
img9=imread('Eve/Eve_Axial 787 2565+000256-000.jpg');
img10=imread('Eve/Eve_Axial bone+000255-000.jpg');
%%%%%%%%%%%%%%%%%%%%%%
%% BINARY
img8=convert2gray(img8);
img9=convert2gray(img9);
img10=convert2gray(img10)>0.8;
%%%%%%%%%%%%%%%%%%%%
%% COVERSION A HOUNFIELD
img1=img9;
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
DHU=DHU.*img10;
%%%%%%%%%%%%%%%%%%%%
%% GRAFICAS
figure;imagesc(BHU);daspect([1,1,1]);title('BHU');colormap('bone');colorbar;
figure;imagesc(DHU);daspect([1,1,1]);title('DHU');colormap('bone');colorbar;