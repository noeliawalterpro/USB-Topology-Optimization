HU=1;
nB=2;
%% PROPIEDADES DEL MATERIAL
%% E[MPa]
%%%%%%%%%%%%%%%%%%%%%%
%% MATERIAL VACIO
EMat(1)=Emin;
nuMat(1)=nu;
mesh(:,1)=mV(:);
%% ANDAMIO
EMat(2)=E0;
nuMat(2)=nu;
mesh(:,2)=design(:);

if HU==1
   %% DICOM
    img11=imread(strcat(Directory,CASO,'_',sizeImg,'_dicom.png'));%% Lectura de Imagen
    [img11] = img_resize(img11,Scale);%% RESIZE
    %% CONVERSION HU
    mDICOM=convert2gray(img11);
    %% CONVERSION HU
    [BHU, DHU]= HU2DEN(mDICOM,HUmin,HUmax,Dmin,Dmax);
    DHU=DHU.*(mB);
    %% MATERIAL OSEO
    EMat(3)=EB;
    nuMat(3)=nuB;
    mesh(:,3)=mB(:);
    %% CROMO
    EMat(4)=ECr;
    nuMat(4)=nuCr;
    mesh(:,4)=mCr(:);
   
   
 
     textMat={'Vacio','Titanio','Dicom','Cromo'};
else
    %% CORTICAL
    EMat(3)=EBc;
    nuMat(3)=nuBc;
    mesh(:,3)=mBc(:);
    %% ESPONJOSO
    if nB==2
        EMat(4)=EBc;
        nuMat(4)=nuBc;
        textMat={'Vacio','Titanio','Cortical','Cortical','Cromo'};
    else
        EMat(4)=EBe;
        nuMat(4)=nuBe;
         
        textMat={'Vacio','Titanio','Cortical','Esponjoso','Cromo'};
        
    end
   mesh(:,4)=mBe(:);
    %% CROMO
    EMat(5)=ECr;
    nuMat(5)=nuCr;
    mesh(:,5)=mCr(:);
    
end
