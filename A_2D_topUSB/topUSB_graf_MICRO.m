disp('topUSB_graf_MICRO')
set(0,'DefaultFigureWindowStyle','normal')
%

[ ny nx]=size(d2);
%visual=zeros(nely*20,nelx*20);

visual=[];
aa=[];

k=1;
for i=1:nx
    aa=[];
    for j=1:ny
        bb=0;
        n = d2(k);
        if n>0.001 && n<1-PorObj
            aa=[aa; mic2];
            bb=1;
            k=k+1;
            
        elseif n>1-PorObj && n<0.99  && bb==0
            aa=[aa; mic1];
            bb=1;
            k=k+1;
            
        elseif n<0.001 && bb==0
            aa=[aa; ones(20,20)];
            bb=1;
            k=k+1;
            
        else
            aa=[aa; zeros(20,20)];
            bb=1;
            k=k+1;
            
        end
        
    end
    
    visual=[visual aa];
    
end

colormap(gray);
imagesc(visual)
daspect([1 1 1]);
axis off