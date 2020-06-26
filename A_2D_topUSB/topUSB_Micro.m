disp('topUSB_Micro')
img1=imread(strcat('Micro\',nmicro,'_2.png'));
img2=imread(strcat('Micro\',nmicro,'_1.png'));

mic1=convert2gray(img1);
mic2=convert2gray(img2);

tot=[mic1 mic2; mic2 mic1];

[rowP,colP]=find(xPhysA>0);
% bP=xPhysA(min(rowP):max(rowP),min(colP):max(colP));

d2=xPhysA;
 d2(union(1:min(rowP)-1,max(rowP)+1:nely),:)=[];
 d2(:,union(1:min(colP)-1,max(colP)+1:nelx))=[];

