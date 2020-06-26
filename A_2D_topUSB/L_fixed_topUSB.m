

fix_L= find(binary_fix==1);
ne_fix=max(size(fix_L));
aa=[];
for i=1:ne_fix
    %DOFs 2n ? 1 horizontal  and 2n vertical
    n=fix_L(i);
    for j=1:length(gdlL)
        aa=[aa,edofMat(n,gdlL(j))];
    end
    
end
aa=unique(aa);
fixeddofs =[aa,fixeddofs];

%clear binary_fix fix_L aa fix_L ne_fix