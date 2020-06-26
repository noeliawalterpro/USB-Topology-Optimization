function Nc=Nc(seda,eta)
n1=1/4*(1-seda)*(1-eta);
n2=1/4*(1+seda)*(1-eta);
n3=1/4*(1+seda)*(1+eta);
n4=1/4*(1-seda)*(1+eta);

Nc= [n1 0   n2 0   n3 0   n4 0;
     0  n1  0  n2  0  n3  0  n4];