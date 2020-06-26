%% HALF MMB
if MALLADO==0 || MALLADO==3
    passive = zeros(nely,nelx);
    xPhys=ones(nely,nelx);
    design=xPhys;
    for i = 1:nelx
        for j = 1:nely
            if sqrt((j-nely/2)^2+(i-nelx/2)^2)< (nely/4)
                design(j,i) = 0;
            end
        end
        
    end
    
end
if MALLADO==1|| MALLADO==3
    set(0,'DefaultFigureWindowStyle','docked')
    
    U= zeros(2*(nely+1)*(nelx+1),1);
    %% COND BORDE FIJA
    fixeddofs =union( [edofMat((nely)*round((nelx)/2)-round((nely+1)/2),1)],...
        [edofMat((nely)*round((nelx)/2)-round((nely+1)/2),7)]   );
    
    %% CARGA EN X
    %% Grados de libertad en y   % Grados de libertad en x
    % (8)_____________(6)       % (7)_____________(5)
    %    |            |         %    |            |
    %    |            |         %    |            |
    %    |            |         %    |            |
    % (2)|____________|(4)      % (1)|____________|(3)
    
    aaaa= zeros(nely,nelx);
    aaaa(1:nely,1)=1;
    binary_loadi=aaaa;
    gdlL=[1,7];
    Loadi=-fx;
    L_f_topUSB
    %% CARGA EN X
 %   figure;imagesc(aaaa);daspect([1 1 1]);
    aaaa= zeros(nely,nelx);
    aaaa(1:nely,nelx)=1;
    binary_loadi=aaaa;
    
    gdlL=[3,5];
    Loadi=fx;
    L_f_topUSB
    %%%
    aaaa((nely)*round((nelx)/2)-round((nely+1)/2))=1;
 %   figure;imagesc(aaaa);daspect([1 1 1]);
    set(0,'DefaultFigureWindowStyle','normal')
    
    
end