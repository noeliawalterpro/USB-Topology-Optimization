
%%
clear mesh
%% PROPIEDADES DEL MATERIAL
%% E[MPa]
%%%%%%%%%%%%%%%%%%%%%%
%% MATERIAL VACIO
EMat(1)=Emin;
nuMat(1)=nu;
SyMat(1)=Sy0;
mesh(:,1)=mV(:);
%% ANDAMIO
EMat(2)=E0;
nuMat(2)=nu;
SyMat(2)=Sy0;
mesh(:,2)=design(:);

if HU==1
 %% DICOM
    img11=imread(strcat(Directory,CASO,'_',sizeImg,'_dicom.png'));%% Lectura de Imagen
    [img11] = img_resize(img11,Scale);%% RESIZE
    %% CONVERSION HU
    mDICOM=convert2gray(img11);
    %% CONVERSION HU
    [BHU, DHU]= HU2DEN(mDICOM,HUmin,HUmax,Dmin,Dmax);
    DHU=DHU.*(1-mpt);
    %% MATERIAL OSEO
    
    EMat(3)=EB;
    nuMat(3)=nuB;
    SyMat(3)=SyB;
    mesh(:,3)=mB(:);
    %% PLACA TORNILLO
    EMat(4)=Ept;
    nuMat(4)=nupt;
    SyMat(4)=Sypt;
    mesh(:,4)=mpt(:);
    textMat={'Vacio','Diseño','Dicom','Placa+Tornillo'};
    
else
    %% CORTICAL
    EMat(3)=EBc;
    nuMat(3)=nuBc;
    SyMat(3)=SyBc;
    mesh(:,3)=mBc(:);
    %% ESPONJOSO
    if nB==2
        mesh(:,3)=mBc(:)+mBe(:);
        textMat={'Vacio','Andamio Inicial','Cortical','Placa+Tornillo'};
        %% PLACA TORNILLO
        EMat(4)=Ept;
        nuMat(4)=nupt;
        SyMat(4)=Sypt;
        mesh(:,4)=mpt(:);
    else
        EMat(4)=EBe;
        nuMat(4)=nuBe;
        SyMat(4)=SyBe;
        mesh(:,4)=mBe(:);
        
        textMat={'Vacio','Andamio Inicial','Cortical','Esponjoso','Placa+Tornillo'};
        %% PLACA TORNILLO
        EMat(5)=Ept;
        nuMat(5)=nupt;
        SyMat(5)=Sypt;
        mesh(:,5)=mpt(:);
    end
    
    
    
end

