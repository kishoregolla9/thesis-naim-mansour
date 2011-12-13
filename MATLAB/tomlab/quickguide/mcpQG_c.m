% mcpQG_c - nonlinear constraint vector for mpec quick guide example
%
% function c = mcpQG_c(x, Prob)

function c = mcpQG_c(x,Prob)

c = [ 2*(x(2)-1) - 1.5*x(1) + x(3) - 0.5*x(4) + x(5); ...
      3*x(1) - x(2) - 3; ...
     -x(1) + 0.5*x(2) + 4; ...
     -x(1) - x(2) + 7 ];