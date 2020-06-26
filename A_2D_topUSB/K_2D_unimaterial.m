
%% Matriz de Rigidez
K_isotrop_topUSB

%% Modulo de Young del material del andamio
Ee=design.*(Emin+(xPhys).^penal*(E0-Emin))+(1-mB+design)*Emin;%%+EBc_e+EBe_e;
if loopt>1 && METODO==88
    Ee=Erem;
end
%% Calculo de matriz de Rigidez del andamio
sK = reshape(KE(:)*Ee(:)',64*nelx,nely,1);
Etot_e=Ee;
Material=(1-design)*0+(xPhys>0.2)*3+(xPhys<0.1)*0;
%Material=mBe*1+mBc*2+(1-design)*0+xPhys>0*3;