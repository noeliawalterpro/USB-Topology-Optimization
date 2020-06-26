disp('topUSB_h_graf3')
topUSB_h_xxyy

if flagImagesc==1    
    if GRAF_ViewDesign==1
         dd=xPhysAi;
        cc=cc.*dd;
        NxPhys=sum(dd(:));
        
        [rowDV,colDV]=find(dd>0);
        cv=cc(min(rowDV):max(rowDV),min(colDV):max(colDV));
    else
        cv=cc;
    end
    imagesc(cv);colormap(jet); colorbar;
    daspect([1 1 1]);%0.014653 seconds.
else
    topUSB_graf2(dd,paso,nely,xx,yy,cc);%  0.158534 seconds.  %10 veces mas lento
end
%% TITULO DE FIGURA
colormap(jet);
title({[strcat(fname,num2str(loop))];...
    strcat('min=',num2str(min(cc(find(dd>0)))));
    strcat('max=',num2str(max(cc(find(dd>0)))));...
    strcat('media=',num2str(sum(cc(find(dd>0)))/NxPhys))},'FontSize',10);

%clear cc