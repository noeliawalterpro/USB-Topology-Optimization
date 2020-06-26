disp('topUSB_2D_B')
%%
ae=0.25*(-xe(:,1)+xe(:,2)+xe(:,3)-xe(:,4));
be=0.25*(-xe(:,1)-xe(:,2)+xe(:,3)+xe(:,4));
ce=0.25*(xe(:,1)-xe(:,2)+xe(:,3)-xe(:,4));
de=0.25*(xe(:,1)+xe(:,2)+xe(:,3)+xe(:,4));

ee=0.25*(-ye(:,1)+ye(:,2)+ye(:,3)-ye(:,4));
fe=0.25*(-ye(:,1)-ye(:,2)+ye(:,3)+ye(:,4));
ge=0.25*(ye(:,1)-ye(:,2)+ye(:,3)-ye(:,4));
he=0.25*(ye(:,1)+ye(:,2)+ye(:,3)+ye(:,4));
 
i=1;
aa=0.57735026919;
eta=-aa;
zeda=-aa;
J11=ae(i)+ce(i)*eta;
J12(i)=ee(i)+ge(i)*eta;
J21(i)=be(i)+ce(i)*zeda;
J22(i)=fe(i)+ge(i)*zeda;
detJ(i)=J11(i)*J22(i)-J12(i)*J21(i);
Ba1=Bc(eta,zeda,detJ(i),J22(i),J12(i),J21(i),J11(i));
eta=aa;
zeda=aa;
J11=ae(i)+ce(i)*eta;
J12(i)=ee(i)+ge(i)*eta;
J21(i)=be(i)+ce(i)*zeda;
J22(i)=fe(i)+ge(i)*zeda;
Ba2=Bc(eta,zeda,detJ(i),J22(i),J12(i),J21(i),J11(i));
eta=aa;
zeda=-aa;
J11=ae(i)+ce(i)*eta;
J12(i)=ee(i)+ge(i)*eta;
J21(i)=be(i)+ce(i)*zeda;
J22(i)=fe(i)+ge(i)*zeda;
Ba3=Bc(eta,zeda,detJ(i),J22(i),J12(i),J21(i),J11(i));
eta=-aa;
zeda=+aa;
J11=ae(i)+ce(i)*eta;
J12(i)=ee(i)+ge(i)*eta;
J21(i)=be(i)+ce(i)*zeda;
J22(i)=fe(i)+ge(i)*zeda;
Ba4=Bc(eta,zeda,detJ(i),J22(i),J12(i),J21(i),J11(i));
%CONST=0.2000;
CONST=1;
Ba1=Ba1*CONST;
Ba2=Ba2*CONST;
Ba3=Ba3*CONST;
Ba4=Ba4*CONST;


B=Ba1+Ba2+Ba3+Ba4;
%% NO RECUERDO PORQUE DIVIDIR ENTRE DOS
%B=B/2;
clear J11 J12 J21 J22 CONST i aa