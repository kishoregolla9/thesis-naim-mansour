function y = tomnumeric(o)
% tomSym/tomnumeric - isnumeric for tomSym

% Per Rutquist, Tomlab Optimization Inc, E-mail: tomlab@tomopt.com
% Copyright (c) 2008-2009 by Tomlab Optimization Inc.
% Last modified 2009-08-21 by rutquist for TOMLAB release 7.7

y = true;

for i=1:length(o.s)
    if strcmp(o.s(i).op,'tom')
        y = false;
        return
    end
end
