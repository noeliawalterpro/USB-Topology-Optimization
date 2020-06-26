Pmax  = 1000e-3; % R2[mm]
Pmin  = 200e-3; % R3[mm]
PCmin  = 300e-3; % R4[mm]
DSmin = 200e-3; % R5[mm]

pasoa=PCmin+DSmin;
for  i=1:400
paso(i)=pasoa+i*0.01;
%% RESTRICCIONES

%% HOMOGENIZACION
%% [b] Poro
bmin=0;%[mm]
bmax=(Pmax-PCmin*sqrt(2))/paso(i);%[mm]
%% [a] Poro conectivo
 amax=min(1-DSmin/paso(i), (Pmax/paso(i))/sqrt(2));
        
amin=PCmin/paso(i);%[mm];
%%
VOLvaciomin=2*amax-pi*bmin.^2;
VOLvaciomax=2*amin-pi*bmax.^2;
xPormin(i)=max(0,VOLvaciomax*100);
xPormax(i)=min(100,VOLvaciomin*100);

end
figure1 = figure('Color',[1 1 1]);
hold on
plot(paso*1000,xPormin,'DisplayName','xPorMin')
plot(paso*1000,xPormax,'DisplayName','xPorMax','LineStyle','--')
legend show
% Create xlabel
xlabel('Tamaño de Microestructura [\mum]','FontSize',15);

% Create ylabel
ylabel('Porosidad [%]','FontSize',15);
ylim([0 100])

grid on
