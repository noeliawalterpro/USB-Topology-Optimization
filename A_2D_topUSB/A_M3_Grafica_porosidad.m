Pmax  = 500e-3; % R2[mm]
Pmin  = 200e-3; % R3[mm]
PCmin  = 300e-3; % R4[mm]
DSmin = 200e-3; % R5[mm]

pasoa=PCmin+DSmin;
for  i=1:100
paso(i)=pasoa+i*0.01;
%% RESTRICCIONES

%% HOMOGENIZACION

%% [a] Poro conectivo
amax=min(Pmax/paso(i),1-DSmin/paso(i))%[mm]
amin=max(PCmin/paso(i),Pmin/paso(i))%[mm]
%%

VOLvaciomin=min(pi*amin.^2/4,pi*amax.^2/4);
VOLvaciomax=max(pi*amin.^2/4,pi*amax.^2/4);
xPormin(i)=VOLvaciomin*100;
xPormax(i)=VOLvaciomax*100;

end
figure1 = figure('Color',[1 1 1]);
hold on
plot(paso*1000,xPormin,'DisplayName','xPorMin')
plot(paso*1000,xPormax,'DisplayName','xPorMax','LineStyle','--')
legend show
% Create xlabel
xlabel('Tamaño de Microestructura [\mum]','FontSize',15);

% Create ylabel
ylabel('Porosidad','FontSize',15);
ylim([0 100])

grid on
