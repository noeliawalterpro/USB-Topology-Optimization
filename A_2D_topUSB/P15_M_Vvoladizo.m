%%


Fi= Fi+sparse(2,1,fy,gdl,1);
aaaa=design;
aaaa(nely*nelx:-1:nely*nelx-nely+1)=1;
binary_fix=aaaa;
gdlL=[3,4,5,6];
L_fixed_topUSB


aaaa=design;
aaaa(nely*nelx:-1:nely*nelx-nely+1)=0.5;
figure;imagesc(design);daspect([1 1 1]);
figure;imagesc(aaaa);daspect([1 1 1]);
