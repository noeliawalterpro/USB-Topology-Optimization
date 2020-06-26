%% REMODELADO OSEO

%% REMODELADO % dental
C=100e3;
gama=2;
% om_max=1;
% om_min=-1;
fro=1; %filtro exponencial
dt=1;
Kk=0.25; %(a) K=0.0048 J/g; (b) K=0.005 J/g; (c) K=0.0052 J/g; (d) K=0.0054 J/g; (e)K=0.0056 J/g.
tao=1; %(g/cm3)2/(MPa.time unit)
rho=xPhys*1.74;
rhonew=xPhys;
Erem=C*rho.^gama+Emin;

loopt=0;
maxloopt=1000;
SED=x;
s=0.1;
tao=1;%(g/cm3)2/(MPa time-unit)
D=0.0375/paso;
R2=D;
%% PREPARE FILTER
iH = ones(nelx*nely*(2*(ceil(R2)-1)+1)^2,1);
jH = ones(size(iH));
sH = zeros(size(iH));
k = 0;
%%
figure

for i1 = 1:nelx
    for j1 = 1:nely
        el = (i1-1)*nely+j1;
        for i2 = max(i1-(ceil(R2)-1),1):min(i1+( ceil(R2)-1),nelx)
            for j2 = max(j1-(ceil(R2)-1),1):min(j1+( ceil(R2)-1),nely)
                e2 = (i2-1)*nely+j2;
                k = k+1;
                
                iH(k) = el;
                jH(k) = e2;
                sH(k) =  max(0,R2-sqrt((i1-i2)^2+(j1-j2)^2));
            end
        end
    end
end

H = sparse(iH,jH,sH);
clear iH jH sH
Hs = sum(H,2);
changero=100;
%%

disp('listo')
%figure
while loopt<maxloopt &&  changero>0.01
    loopt=loopt+1;
    c=0;cant=100;
    nK='K_2D_oseo';
    eval(nfem) %% FEM
    SED=1/2*(esf(1,:)'.*def(1,:)'+...
        esf(2,:)'.*def(2,:)'+...
        esf(3,:)'.*def(3,:)');  
    S=SED(:)./rho(:);
    
    %% Actualizacion de densidad
    F0=S>=(1+s)*Kk;
    F2=S<=(1-s)*Kk;
    F1=(F0+F2)==0;
    if fro==1
        omegat= F0.*(H*(S-(1+s)*Kk)./Hs)+...
            F1*0+...
            F2.*(H*(S-(1-s)*Kk)./Hs);
        
    else
        %% sin filtro
        omegat= F0.*((S-(1+s)*Kk))+...
            F1*0+...
            F2.*((S-(1-s)*Kk));
    end
    %        omegat( omegat<om_min)=om_min;
    %        omegat( omegat>om_max)=om_max;
    rhonew(:)=rho(:)+tao*dt*omegat(:);
    rhonew(rhonew<0)=0.01;
    rhonew(rhonew>1.74)=1.74;
    rhonew(:) = (H*rhonew(:))./Hs;
    Erem=C*rhonew.^gama;
    
    
    %%  GRAFICA
    imagesc(rho)
    daspect([1 1 1]); colorbar;
    colormap(1-gray); pause(1e-6)
    %%
    changero=mean(abs(S-Kk));
    
    rho(:)=rhonew(:);
end

disp('fin')