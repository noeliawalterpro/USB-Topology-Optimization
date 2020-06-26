%% HALF MMB
if MALLADO==0 || MALLADO==3
    passive=zeros(nely,nelx);
    xPhys=ones(nely,nelx);
    design=xPhys;
    for i = 1:nelx
        for j = 1:nely
            if sqrt((j-nely/2)^2+(i-nelx/3)^2)< nely/3
                passive(j,i) = 1;
            end
        end
        design(passive==1) = 0;
        design(passive==2) = 1;
        
    end
end
if MALLADO==1 || MALLADO==3
    Fi= sparse(2,1,fy,2*(nely+1)*(nelx+1),1);
    U= zeros(2*(nely+1)*(nelx+1),1);
    fixeddofs = union([1:2:2*(nely+1)],[2*(nelx+1)*(nely+1)]);
end