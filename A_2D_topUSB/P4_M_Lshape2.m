%% HALF MMB
disp('P4_M_LSHAPE2')
    xPhys=zeros(nely,nelx);
    xPhys(:,1:round(nelx/2))=1;
    xPhys(round(nely/2):nely,:)=1;
    design=xPhys;
    x=xPhys;
    Fi= sparse(2*nodos-round(0.75*nely),1,fy,gdl,1);
    
    %%
    binary_fix=zeros(nely,nelx);
    
    binary_fix(1,1)=1;
    fix_L= find(binary_fix==1);
    ne_fix=max(size(fix_L));
    aa=[];
    %% Grados de libertad en y   % Grados de libertad en x
    % (8)_____________(6)       % (7)_____________(5)
    %    |            |         %    |            |
    %    |            |         %    |            |
    %    |            |         %    |            |
    % (2)|____________|(4)      % (1)|____________|(3)
    gdlL=[7,8];
    n=fix_L;
    for j=1:length(gdlL)
        aa=[aa,edofMat(n,gdlL(j))];
    end
    aa=unique(aa);
    fixeddofs =[aa,fixeddofs];
    %%
    binary_fix=zeros(nely,nelx);
    binary_fix(1,round(nelx/2))=1;
    
    fix_L= find(binary_fix==1);
    ne_fix=max(size(fix_L));
    aa=[];
    %% Grados de libertad en y   % Grados de libertad en x
    % (8)_____________(6)       % (7)_____________(5)
    %    |            |         %    |            |
    %    |            |         %    |            |
    %    |            |         %    |            |
    % (2)|____________|(4)      % (1)|____________|(3)
    gdlL=[5,6];
    n=fix_L;
    for j=1:length(gdlL)
        aa=[aa,edofMat(n,gdlL(j))];
    end
    aa=unique(aa);
    fixeddofs =[aa,fixeddofs];
