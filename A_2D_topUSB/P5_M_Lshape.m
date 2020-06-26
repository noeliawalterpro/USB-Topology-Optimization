%% HALF MMB
if MALLADO==0
    
    xPhys=zeros(nely,nelx);;
    xPhys(:,1:round(nelx/2))=1;
    xPhys(round(nely/2):nely,:)=1;
    design=xPhys;
else
    Fi= sparse(2*nodos,1,fy,gdl,1);
    binary_fix=zeros(nely,nelx);
    binary_fix(1,1:round(nelx/2))=1;
    fix_L= find(binary_fix==1);
    ne_fix=max(size(fix_L));
    aa=[];
    gdlL=[6,7,8,5];
    for i=1:ne_fix
        %DOFs 2n ? 1 horizontal  and 2n vertical
        n=fix_L(i);
        for j=1:length(gdlL)
            aa=[aa,edofMat(n,gdlL(j))];
        end
        
    end
    aa=unique(aa);
    fixeddofs =[aa,fixeddofs];
end