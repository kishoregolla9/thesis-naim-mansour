% mcpQG_d2c - The second part of the Hessian to the Lagrangian function for the
%     nonlinear constraints for mpec quick guide example, i.e.:
%
%           lam' * d2c(x)
%
% in
%
%   L(x,lam) =   f(x) - lam' * c(x)
% d2L(x,lam) = d2f(x) - lam' * d2c(x) = H(x) - lam' * d2c(x)
% 
% function d2c=mcpQG_d2c(x, lam, Prob)

function d2c = mcpQG_d2c(x,lam,Prob)

d2c = zeros(5,5);