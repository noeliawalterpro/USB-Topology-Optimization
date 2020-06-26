if MALLADO==0
    xPhys=ones(nely,nelx);
    design=xPhys;
else%%
    elem=round(nely*nelx/2);
    mgdl=edofMat(elem,4);
    Fi= Fi+sparse(mgdl,1,fy,gdl,1);
    fixeddofs = [edofMat(nely*nelx,4),edofMat(nely*nelx,3),edofMat(nely,2),edofMat(nely,3)];
    aaaa=design;
    aaaa(elem)=0.5;
    figure;imagesc(aaaa);daspect([1 1 1]);
end