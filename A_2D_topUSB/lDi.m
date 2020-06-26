function [Di]=lDi(nu)
% %% PREPARE FINITE ELEMENT ANALYSIS
Di= 1/(1-nu^2)*[1 nu 0;nu 1 0;0 0 (1-nu)/2];
end