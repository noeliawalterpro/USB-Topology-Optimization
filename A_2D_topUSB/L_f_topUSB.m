
Load_Li=find(binary_loadi==1);
ne_Loadi=max(size(Load_Li));
aa=[];
for i=1:ne_Loadi
    n=Load_Li(i);
    for j=1:length(gdlL)
        
        aa=[aa,edofMat(n,gdlL(j))];
        
    end
end
Loadi=Loadi;
aa=unique(aa);
Fi=Fi+sparse(aa,1,Loadi/(length(aa)),gdl,1);

%clear binary_loadi Load_Li aa ne_Loadi
