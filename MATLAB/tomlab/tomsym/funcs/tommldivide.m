function x = tommldivide(A,b,x0)
% tominv - tomSym varation of \ (mldivide) 
%
% X = TOMMRDIVIDE(A,B) finds X so that A*X == B
%
% X = TOMINV(A,B,X0) also provides a starting guess for X. This may
% speed up convergence.
%
% The difference between tommldivide(A,B) and A\B is that tommrdivide does
% not solve the sytem explicitly. Insted it creates an extra unknown and 
% equation for the solver. This avoids problems with ill-conditioned
% matrices that may otherwise occur. If the system has more than one
% soluton, then the optimization objective will determine which one is
% returned.
%
% See also: subjectTo, tommrdivide, tominv

% Per Rutquist, Tomlab Optimization Inc, E-mail: tomlab@tomopt.com
% Copyright (c) 2011 by Tomlab Optimization Inc.
% Last modified 2011-05-09 by rutquist for TOMLAB release 7.7

if nargin<3
    x0 = zeros(size(A,2),size(b,2));
end

sx = tom([],size(x0));

x = subjectTo(sx,sx==x0,A*sx==b);
