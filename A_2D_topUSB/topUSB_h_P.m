[rowP,colP]=find(xPhysA>0);
bP=xPhysA(min(rowP):max(rowP),min(colP):max(colP));

%% porcentaje de porosidad 
%% bP area del andamio 
%% passive area no porosa del andamio
%% xPhysAi area de la celda unitaria andamio 
xPor=1-((sum(bP(:))-sum(sum(passive==2))))/(sum(bP(:)>0)-sum(sum(passive==2)));
clear bP rowP colP
