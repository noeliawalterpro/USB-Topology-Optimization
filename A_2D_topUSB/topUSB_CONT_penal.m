% As previously presented by
% Groenwold and Etman (2010)
% Though this methodology is not proven to converge to
%the global optimum, it regularizes the algorithm and allows
%the comparison of different optimization strategies.
%% Implementing the continuation strategy is done by adding
%% a single line after line 68: 

if loop<= 20, penal=1; else penal=min(pmax,1.02*penal); end