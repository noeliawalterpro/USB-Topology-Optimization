xPhys=zeros(nely,nelx);
nmat=length(mesh(1,:));%% material
for i=3:nmat
    xPhys(:)=xPhys(:)+mesh(:,i).*(1-design(:));
end
%xPhys=xPhysA.*(design);
xPhys=xPhysA.*(design)+xPhys;
if HU==1 
    %% Calulo de modulo young de todos los elementos
    xPhys(:)=xPhys(:).*(1-mB(:))+(mB(:).*mDICOM(:));
end
NxPhys=length(find(xPhys>0));

