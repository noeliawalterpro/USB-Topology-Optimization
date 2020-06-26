%% 01  % MBB_T
nproblema='P1_M_HALF_MBB';
fy=-500;
nelx=2*96*N;nely=40*N;lx=2*360.294;
paso=lx/nelx;
ly=nely*paso;
%%%%%%%%%%%%%%%%%%%%%%
%% PROPIEDADES DEL MATERIAL
nu=0.3;E0=210e3;
Emin=E0*1e-4;