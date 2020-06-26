cant=c;

%% Modulo de Young del material del andamio
Ee=design;
if loopt>1 && METODO==88
    Ee=Erem;
end
%% Calculo de matriz de Rigidez del andamio
sK = reshape(KA(:)*Ee(:)',64*nelx,nely,1);

Etot_e=Ee;
Material=(1-design)*0+(xPhys>0.2)*3+(xPhys<0.1)*0;


