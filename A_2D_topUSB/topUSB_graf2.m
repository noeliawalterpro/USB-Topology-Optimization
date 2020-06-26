function topUSB_graf2(xp,paso,nely,xx,yy,cc)
xp=flip(xp,1);
cc=flip(cc,1);
yyy=yy;
 aa=find(xp(:)<0.1);%Ubicar elementos menores a 0.1
 xx(aa,:)=[];yyy(aa,:)=[];cc(aa)=[];%Eliminar elementos menores a 0.1
p=patch(xx',yyy',cc(:));%Graficar
set(gcf,'Color',[1 1 1]);

daspect([1 1 1]);colorbar;
grid off;
%set(p,'EdgeColor','k');
set(p,'EdgeColor','none');
end


