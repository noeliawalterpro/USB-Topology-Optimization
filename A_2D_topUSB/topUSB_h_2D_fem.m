cant=c;

%% Calculo de matriz osea
eval(nK)
%% Calculo de matriz global
K= sparse(iK,jK,sK);
K = (K+K')/2;
tic;
U(freedofs) = K(freedofs,freedofs)\F(freedofs);
tfem2=toc;
cpu= cputime;
%% RESIDUO res = norm(A*z-b)
res = norm(K(freedofs,freedofs)*U(freedofs,:)-F(freedofs,:));

%% ESFUERZO DEFORMACION
eval(n_esf_def);
%% VIEW DESIGN
if GRAF_ViewDesign==1
    dd=design;
else
    dd=xPhys;
end
%% COMPU MAMA
% tic; U(freedofs,:)= mldivide(K(freedofs,freedofs),F(freedofs,:));toc %0.879654 seconds.
% Elapsed time is 0.660497 seconds tElapsedcpu_total = 0.9360
% tic;U(freedofs) = K(freedofs,freedofs)\F(freedofs);toc
% Elapsed time is 0.551104 seconds.  tElapsedcpu_total = 0.9828