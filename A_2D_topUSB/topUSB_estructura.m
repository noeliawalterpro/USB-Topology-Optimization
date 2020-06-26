disp('topUSB_estructura')
%%
set(0,'DefaultFigureWindowStyle','normal')
figure('color',[1,1,1]);colormap(1-gray);

if GRAF_ViewDesign==1
    ylim([min(rowDV(1), rowDV(end)) max(rowDV(1), rowDV(end))] )
    xlim([colDV(1) colDV(end)])
    imagesc(xPhysA); daspect([1 1 1]);
else
     imagesc(xPhys); daspect([1 1 1]);
 end
axis off
pause(0.1)