%%
elem=round(nely*nelx/2)+1;
mgdl=edofMat(elem,4);
Fi= Fi+sparse(mgdl,1,fy,gdl,1);
fixeddofs = [edofMat(nely*nelx,4),edofMat(nely*nelx,3),edofMat(nely,2)];
aaaa=design;
aaaa(elem)=0.5;
%figure;imagesc(aaaa);daspect([1 1 1]);
