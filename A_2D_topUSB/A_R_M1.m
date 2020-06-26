Pmax  = 500e-3; % R2[mm]
Pmin  = 200e-3; % R3[mm]
PCmin  = 300e-3; % R4[mm]
DSmin = 200e-3; % R5[mm]

%% HOMOGENIZACION
%% [a] Poro conectivo
amax=min(Pmax/paso/sqrt(2),1-DSmin/paso)%[mm]
amin=PCmin/paso%[mm]
%% [b] Poro
%% [b] Poro
bmin=0;%[mm]
bmax=(Pmax-PCmin*sqrt(2))/paso;%[mm]
%% [a] Poro conectivo
amax=min(1-DSmin/paso, (Pmax/paso)/sqrt(2));
        
amin=PCmin/paso;%[mm];
%%
VOLvaciomin=2*amax-pi*bmin.^2;
VOLvaciomax=2*amin-pi*bmax.^2;
xPormin=VOLvaciomax
xPormax=VOLvaciomin

if xPormin>PorObj    || (xPormax<PorObj && xPormax<1)
    disp('/////////parametros entrada////////////////')
    fprintf('Porosidad   Pmin.:%0.3e PorObj.:%0.3e\n',xPormin,PorObj);
    fprintf('Porosidad   Pmax.:%0.3e PorObj.:%0.3e\n',xPormax,PorObj);
    pause
end