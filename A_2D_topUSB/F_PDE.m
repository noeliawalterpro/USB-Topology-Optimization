%% PREPARATION FILTER 
Rmin = rmin/2/sqrt(3);
KEF = Rmin^2*[4 -1 -2 -1; -1 4 -1 -2; ...
-2 -1 4 -1; -1 -2 -1 4]/6 + ...
[4 2 1 2; 2 4 2 1; ...
1 2 4 2; 2 1 2 4]/36;
 edofVecF = reshape(nodenrs(1:end-1,1:end-1),nelx*nely,1);
 edofMatF = repmat(edofVecF,1,4) + ...
repmat([0 nely+[1:2] 1],nelx*nely,1);
iKF = reshape(kron(edofMatF,ones(4,1))',16*nelx*nely,1);
jKF = reshape(kron(edofMatF,ones(1,4))',16*nelx*nely,1);
sKF = reshape(KEF(:)*ones(1,nelx*nely),16*nelx*nely,1);
KF = sparse(iKF,jKF,sKF);
LF = chol(KF,'lower');
iTF = reshape(edofMatF,4*nelx*nely,1);
jTF = reshape(repmat([1:nelx*nely],4,1)',4*nelx*nely,1);
sTF = repmat(1/4,4*nelx*nely,1);
TF = sparse(iTF,jTF,sTF);

SENS='FSENS_PDE';
SENSab='FSENS_PDE_ab';
SENSb='FSENS_PDE_b';
DEN='FDEN_PDE';
DENab='FDEN_PDE_ab';
DENb='FDEN_PDE_ab';