if MALLADO==0 || MALLADO==3
    %% bone
    
    img2=imread('ear_301x167_b_solid.png');
    binary_b=convert2gray(img2);
    binary_b2=convert2gray(img2);
    %binary_b=1-binary_b;
    img1=imread('ear_301x167_b_solid.png');
    binary_imp=convert2gray(img1);
    binary_imp=1-binary_b;
    
    %%
    
    
    binary_b=(binary_imp)-(binary_b);
    binary_b=binary_b>0;
    %%
    design=1-binary_imp;
    m1=binary_b;  % solido
    m2=binary_b2.*binary_b; % con escala de grises
else
    img3=imread('ear_301x167_fix.png');
    binary_fix=convert2gray(img3);
    binary_fix=1-binary_fix;
    
    L_fixed_topUSB
    
    img4=imread('ear_301x167_fy.png');
    binary_loadi=1-convert2gray(img4);
    
    
    L_f_topUSB
    
end