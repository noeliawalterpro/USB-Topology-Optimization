%% HALF MMB

Fi= sparse([2*(nely+1)*nelx+2, 2*(nely+1)*(nelx+1)],...
    [1 2],[1 -1],...
    2*(nely+1)*(nelx+1),2);
fixeddofs = [1:2*nely+1];
U= zeros(2*(nely+1)*(nelx+1),2);