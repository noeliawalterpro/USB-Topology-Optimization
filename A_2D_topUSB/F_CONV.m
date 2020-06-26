%% PREPARATION FILTER 

[dy,dx] = meshgrid(-ceil(rmin)+1:ceil(rmin)-1, ...
-ceil(rmin)+1:ceil(rmin)-1);
jj = max(0,rmin-sqrt(dx.^2+dy.^2));
Hs = conv2(ones(nely,nelx),jj,'same');
clear dx dy

SENS='FSENS_CONV';
SENSab='FSENS_CONV_ab';
SENSb='FSENS_CONV_b';
SENSa='FSENS_CONV_a';
DEN='FDEN_CONV';
DENab='FDEN_CONV_ab';
DENb='FDEN_CONV_b';
DENa='FDEN_CONV_a';