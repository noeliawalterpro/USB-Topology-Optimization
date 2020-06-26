colormap(1-( (1:nmat)'*[1, 1, 1]/nmat))
%colorbar('Ticks',[(1:nmat)'])
 colorbar('Ticks',[(1:nmat)'],'TickLabels',textMat)
colormap(jet);