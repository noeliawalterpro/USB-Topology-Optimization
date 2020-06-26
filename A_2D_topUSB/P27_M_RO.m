%% SOPORTE 
gdlL=[2,4];
binary_fix=zeros(nely,nelx);
binary_fix(nely,2:nelx)=1;
fix_L= find(binary_fix==1);
ne_fix=max(size(fix_L));
aa=[];
for i=1:ne_fix
    n=fix_L(i);
    for j=1:length(gdlL)
        
        aa=[aa,edofMat(n,gdlL(j))];
    end
end
%UY izq y UX UY  en la der 
aa=unique(aa);
fixeddofs =[aa,fixeddofs];
fixeddofs = [fixeddofs, edofMat(nely,1)];

%% CARGA

Lfdy=paso*(nelx);
binary_loadi=zeros(nely,nelx);
binary_loadi(1,1:nelx)=1;
Load_Li=find(binary_loadi==1);
ne_Loadi=max(size(Load_Li));
aa=[];
Fi=Fi*0;
F=F*0;
gdlL=[7,5];
for i=1:1:ne_Loadi
    n=Load_Li(i);
    xa=paso*(i-1);
    xb=paso*i;
    ta=-fy/Lfdy*xa+fy;
    tb=-fy/Lfdy*xb+fy;
       Fi=Fi+sparse(edofMat(n,gdlL(1)+1),1,(Lfdy*(3*ta + tb))/6,gdl,1); 
        Fi=Fi+sparse(edofMat(n,gdlL(2)+1),1,(Lfdy*(ta + tb))/6,gdl,1); 
   
end

