Pmax  =1000e-3; % R2[mm]
Pmin  = 200e-3; % R3[mm]
PCmin  = 300e-3; % R4[mm]
DSmin = 200e-3; % R5[mm]
%% HOMOGENIZACION
%% [a] Poro conectivo
amax=min(Pmax/paso,1-DSmin/paso)%[mm]
amin=max(PCmin/paso,Pmin/paso)%[mm]
%%
xPormax=max(1-(1-amax.^2),1-(1-amin.^2))
xPormin=min(1-(1-amax.^2),1-(1-amin.^2))

if xPormin>PorObj    || xPormax<PorObj
    disp('/////////parametros entrada////////////////')
    fprintf('Porosidad  min.:%0.3e PorObj.:%0.3e\n',...
        xPormin,PorObj);
    fprintf('Porosidad  max.:%0.3e PorObj.:%0.3e\n',...
        xPormax,PorObj);
    
    pause
end