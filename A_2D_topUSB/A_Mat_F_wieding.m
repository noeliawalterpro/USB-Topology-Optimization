
clear mesh

%% PROPIEDADES DEL MATERIAL
%% E[MPa]
%%%%%%%%%%%%%%%%%%%%%%
%% MATERIAL VACIO
EMat(1)=Emin;
nuMat(1)=nu;
mesh(:,1)=mV(:);

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
    EMat(2)=EB;
    nuMat(2)=nuB;
    mesh(:,2)=mB(:);
    SyMat(2)=SyB;
    textMat={'Vacio','Dicom'};
    
else
    %% CORTICAL
    EMat(2)=EBc;
    nuMat(2)=nuBc;
    SyMat(2)=SyBc;
    mesh(:,2)=mBc(:);
    %% ESPONJOSO
    if nB==2
        mesh(:,2)=mBc(:)+mBe(:);
        textMat={'Vacio','Cortical'};
    else
        EMat(3)=EBe;
        nuMat(3)=nuBe;
        SyMat(3)=SyBe;
        mesh(:,3)=mBe(:);
        textMat={'Vacio','Cortical','Esponjoso'};
    end
end
