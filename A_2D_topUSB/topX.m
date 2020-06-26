nelx=100;
nely=100;
volfrac=0.5;
penal=5;
rmin=2;
ft=1;
PREF='F_f';
%function topX(nelx,nely,volfrac,penal,rmin,ft)
%% MATERIAL PROPERTIES
E0 = 1;
Emin = 1e-9;
nu = 0.3;
te=1;
%% PREPARE FINITE ELEMENT ANALYSIS
KE = te*lK(nu);
nodenrs = reshape(1:(1+nelx)*(1+nely),1+nely,1+ nelx);
edofVec = reshape(2*nodenrs(1:end-1,1:end-1)+1, nelx*nely,1);
edofMat = repmat(edofVec,1,8)+repmat([0 1 2*nely+[2 3 0 1] -2 -1],nelx*nely,1);
iK = reshape(kron(edofMat,ones(8,1))',64*nelx*  nely,1);
jK = reshape(kron(edofMat,ones(1,8))',64*nelx*  nely,1);
%% PREPARE FILTER
eval(PREF)
%% PERIODIC BOUNDARY CONDITIONS
e0 = eye(3);
ufixed = zeros(8,3);
U = zeros(2*(nely+1)*(nelx+1),3);
alldofs = (1:2*(nely+1)*(nelx+1));
n1 = [nodenrs(end,[1,end]),nodenrs(1,[end,1])];
d1 = reshape([(2*n1-1);2*n1],1,8);
n3 = [nodenrs(2:end-1,1)',nodenrs(end,2:end-1)];
d3 = reshape([(2*n3-1);2*n3],1,2*(nelx+nely-2));
n4 = [nodenrs(2:end-1,end)',nodenrs(1,2:end-1)];
d4 = reshape([(2*n4-1);2*n4],1,2*(nelx+nely-2));
d2 = setdiff(alldofs,[d1,d3,d4]);
for j = 1:3
    ufixed(3:4,j) =[e0(1,j),e0(3,j)/2;e0(3,j)/2,e0(2,j)]*[nelx;0];
    ufixed(7:8,j) =[e0(1,j),e0(3,j)/2;e0(3,j)/2,e0(2,j)]*[0;nely];
    ufixed(5:6,j) =ufixed(3:4,j)+ufixed(7:8,j);
end
wfixed = [repmat(ufixed(3:4,:),nely-1,1); repmat(ufixed(7:8,:),nelx-1,1)];
%% INITIALIZE ITERATION
qe = cell(3,3);
Q = zeros(3,3);
dQ = cell(3,3);
x= repmat(volfrac,nely,nelx);
for i = 1:nelx
    for j = 1:nely
        if sqrt((i-nelx/2-0.5)^2+(j-nely/2-0.5)^2) <min(nelx,nely)/3
            x(j,i) = volfrac/2;
        end
    end
end
xPhys = x;
change = 1;
loop = 0;
%% START ITERATION
while (change > 0.01)
    loop = loop+1;
    %% FE-ANALYSIS
    sK = reshape(KE(:)*(Emin+xPhys(:)'.^penal*(E0-Emin)),64*nelx*nely,1);
    K = sparse(iK,jK,sK);
    K = (K+K')/2;
    Kr = [K(d2,d2), K(d2,d3)+K(d2,d4); K(d3,d2)+K(d4,d2), K(d3,d3)+K(d4,d3)+K(d3,d4)+K(d4,d4)];
    U(d1,:) = ufixed;
    U([d2,d3],:) = Kr\(-[K(d2,d1); K(d3,d1)+K(d4,d1)]*ufixed-[K(d2,d4);K(d3,d4)+K(d4,d4)]*wfixed);
    U(d4,:) = U(d3,:)+wfixed;
    %% OBJECTIVE FUNCTION AND SENSITIVITY ANALYSIS
    for i=1:3
        for j=1:3
            U1=U(:,i); U2= U(:,j);
            qe{i,j} = reshape(sum((U1(edofMat)*KE).*U2(edofMat),2),nely,nelx)/(nelx*nely);
            Q(i,j) = sum(sum((Emin+xPhys.^penal*(E0-Emin)).*qe{i,j}));
            dQ{i,j} = penal*(E0-Emin)*xPhys.^(penal-1).*qe{i,j};
        end
    end
    c = -(Q(1,1)+Q(2,2)+Q(1,2)+Q(2,1));
    dc = -(dQ{1,1}+dQ{2,2}+dQ{1,2}+dQ{2,1});
    %  c = Q(1,2)-(0.8^loop)*(Q(1,1)+Q(2,2));
    %dc = dQ{1,2}-(0.8^loop)*(dQ{1,1}+dQ{2,2});
    dv = ones(nely,nelx);
    %% FILTERING/MODIFICATION OF SENSITIVITIES
    if ft == 1
        dc(:) = H*(x(:).*dc(:))./Hs./max(1e-3,x(:));
    elseif ft == 2
        dc(:) = H*(dc(:)./Hs);
        dv(:) = H*(dv(:)./Hs);
    end
    %% OPTIMALITY CRITERIA UPDATE OF DESIGN
    %%VARIABLES AND PHYSICAL DENSITIES
    l1 = 0; l2 = 1e9; move = 1e-1;
    while (l2-l1 > 1e-9)
        lmid = 0.5*(l2+l1);
        xnew = max(0,max(x-move,min(1,min(x+move,x.*sqrt(-dc./dv/lmid)))));
        %  xnew = max(0,max(x-move,min(1,min(x+move,x.*(-dc./dv/lmid)))));
        if ft == 1
            xPhys = xnew;
        elseif ft == 2
            xPhys(:) = (H*xnew(:))./Hs;
        end
        
        if mean(xPhys(:)) > volfrac, l1 = lmid;
        else
            l2= lmid;
        end
        
    end
    change = max(abs(xnew(:)-x(:)));
    x = xnew;
    %% PRINT RESULTS
    fprintf(' It.:%5i Obj.:%11.4f Vol.:%7.3f ch.:%7.3f\n',loop,c, mean(xPhys(:)),change)
    %% PLOT DENSITIES
    colormap(gray); imagesc(1-xPhys); caxis([0 1]);   axis equal;    axis off;    drawnow; 
end
%% PERIODIC MATERIAL MICROSTRUCTURE DESIGN
% Design of materials using topology optimization
% and energy-based homogenization approach
% in Matlab
% Liang Xia1 · Piotr Breitkopf1
% Received: 10 April 2014 / Revised: 15 June 2015 / Accepted: 17 June 2015
% © Springer-Verlag Berlin Heidelberg 2015

%volfrac volume fraction
%penal penalization factor
%rmin filter radius
%ft sensitivity filter
%%%(ft=2) density filtering
%%%The volume fraction constraint is
%%%not active in the case of density filtering
%%%(ft=1) sensitivity filtering

disp( 'fin')
