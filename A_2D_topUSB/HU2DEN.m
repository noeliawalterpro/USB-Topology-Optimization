function [BHU,DHU]= HU2DEN(mDICOM,HUmin,HUmax,Dmin,Dmax)
%% Conversion a Hounfield
x1=max(mDICOM(:));
x2=min(mDICOM(find(mDICOM(:)>0)));
a1=(HUmin-HUmax)/(x2-x1);
b2=HUmin-a1*x2;
BHU=(mDICOM)*a1+b2;
%% Conversion a densidad
a1=(Dmin-Dmax)/(HUmin-HUmax);
b2=Dmin-a1*HUmin;
DHU=(BHU)*a1+b2;
