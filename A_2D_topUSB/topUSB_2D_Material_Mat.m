disp('topUSB_2D_Material_Mat')
Material=zeros(nely,nelx);
nmat=size(EMat,2);
%% Actualizacion de malla
for i=1:nmat
    %     %% NUMERO DE MATERIAL
    Material(:)=Material(:)+ sign(mesh(:,i))*i;
end

