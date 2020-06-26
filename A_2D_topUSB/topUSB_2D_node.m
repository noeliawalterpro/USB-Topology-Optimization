disp('topUSB_2D_node')
jj=0;
for j=1:nelx
    for i=1:nely
        
        jj=jj+1;
        %
        node(jj,1)=i+(j-1)*(nely+1);
        node(jj,2)=j*(nely+1)+i;
        node(jj,3)=j*(nely+1)+i+1;
        node(jj,4)=i+(j-1)*(nely+1)+1;%
    end
end
%paso=1;
xi=0:paso:(nelx)*paso;
yi=0:paso:(nely)*paso;
[XI,YI]=meshgrid(xi,yi);
XI=XI(:);
YI=YI(:);
xe=XI(node);
ye=YI(node);

