%% PROPIEDADES DEL MATERIAL
%% E[MPa]
%%%%%%%%%%%%%%%%%%%%%%
%% MATERIAL VACIO
EMat(1)=Emin;
nuMat(1)=nu;
mesh(:,1)=design(:)*0;
%% ANDAMIO
EMat(2)=E0;
nuMat(2)=0.3;
mesh(:,2)=design(:);
%% HALF MMB
if MALLADO==0 || MALLADO==3
    xPhys=ones(nely,nelx);
    design=xPhys;
end
if MALLADO==1 || MALLADO==3
    Fi= sparse(2,1,fy,2*(nely+1)*(nelx+1),1);
    U= zeros(2*(nely+1)*(nelx+1),1);
    fixeddofs = union([1:2:2*(nely+1)],[2*(nelx+1)*(nely+1)]);
end