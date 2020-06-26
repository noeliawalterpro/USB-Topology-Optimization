if MALLADO==0
    xPhys=ones(nely,nelx);
    design=xPhys;
else
    %for j=1:2:7
    Fi= sparse(2*nodos,1,fy,gdl,1);
    %end
    fixeddofs = [1:2*(nely+1)];
    
end
