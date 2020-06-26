%% HALF MMB
fy=-1;
Fy=Fy+ sparse(2,1,fy,2*(nely+1)*(nelx+1),1);
U= zeros(2*(nely+1)*(nelx+1),1);
fixeddofs = union([1:2:2*(nely+1)],[2*(nelx+1)*(nely+1)]);
