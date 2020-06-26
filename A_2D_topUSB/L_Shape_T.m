%% Geometria cantilever michel 2

n=1;
for j=1:ny+1
    for i=1:nx+1
        
        x(n,1:2)=[pasox*(i-1) pasoy*(j-1)];
        n=n+1;
        
    end
end

for j=ny+2:2*(ny+1)
    for i=1:(nx/2+1)

        x(n,1:2)=[pasox*(i-1) pasoy*(j-1)];
        n=n+1;
        
    end
end

n
%pause
n=1;

for j=1:ny
    for i=1:nx
        % triangulo tipo 1
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) i+1+nx*(j-1)+(j-1) nx*j+2+i+(j-1)];
        n=n+1;
        % triangulo tipo 2
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) nx+i+2+nx*(j-1)+(j-1) nx*j+i+1+(j-1)];
        n=n+1;
      
        if j==1 && i==nx
            force=n-1;% numero de elemento
        end
    end
end
n


 j=ny+1
    for i=1:nx/2
        % triangulo tipo 1
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) i+1+nx*(j-1)+(j-1) nx*j+2+i+(j-1)];
        n=n+1;
        % triangulo tipo 2
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) nx+i+2+nx*(j-1)+(j-1) nx*j+i+1+(j-1)];
        n=n+1;
    end 
  j=ny+2
    for i=1:nx/2
        % triangulo tipo 1
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) i+1+nx*(j-1)+(j-1) nx*j+2+i+(j-1)-nx/2];
        n=n+1;
        % triangulo tipo 2
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) nx+i+2+nx*(j-1)+(j-1)-nx/2 nx*j+i+1+(j-1)-nx/2];
        n=n+1;
    end 
    
k=1;
for j=ny+3:2*(ny)+1
    for i=1:nx/2
        % triangulo tipo 1
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) i+1+nx*(j-1)+(j-1) nx*j+2+i+(j-1)-nx/2]-k*nx/2;
        n=n+1;
        % triangulo tipo 2
        Elem(n,1:3)=[i+nx*(j-1)+(j-1) nx+i+2+nx*(j-1)+(j-1)-nx/2 nx*j+i+1+(j-1)-nx/2]-k*nx/2;
        n=n+1;
    end
    k=k+1;
end          



n=1;

%% gdl fijos
for i=1:nx/2
    j=2*(ny)+1;
    fix(n,1)=2*(nx*j+2+i+(j-1)-nx/2-(k-1)*nx/2)-1 ;
    n=n+1;
    fix(n,1)=2*(nx*j+2+i+(j-1)-nx/2-(k-1)*nx/2) ;
    n=n+1;
end

%% FUERZAS
[nodos kkk]=size(x)

[ne kkk]=size(Elem)
%ne=nx*ny*2;
%nodos=(nx+1)*(ny+1);
fset(1:ne,1:6)=0;

% elemento
% tipo 1              tipo 2
%         3          3      2
%         *           *----*
%        /|           | 2 /
%       / |           |  /
%      /  |           | /
%     / 1 |           |/
%    *----*           *
%   1     2           1
%
%  fset [fx1, fy1,   fx2, fy2,  fx3, fy3  ]

fset(force,1:6)=1*[0,0,0,0,0,-F];

%% fraccion de volumen

fmax=0.95;

%%  