% CreateTomProb.m
%
% CreateTomProb creates a mat file with the standard predefined
% test problems in TOMLAB.
%
% The file is tomlab\lib\TomlabProblem.mat
% 
% All user defined additions to the file is then overwritten.

% Kenneth Holmstrom, Tomlab Optimization Inc, E-mail: tomlab@tomopt.com
% Copyright (c) 1999-2005 by Tomlab Optimization Inc., $Release: 4.8.0$
% Written Sep 13, 1999.   Last modified June 2, 2005.

function CreateTomProb

tomProb.Name=str2mat(...
        'mgh More, Garbow, Hillstrom'...
       ,'cto CUTE Constrained problems'...
       ,'ctl CUTE Large Constrained problems'...
       ,'uto CUTE Unconstrained problems'...
       ,'utl CUTE Large Unconstrained problems'...
       ,'amp AMPL models in nl format'...
       ,'nls Nonlinear Constrained Least Squares'...
       ,'nts Nonlinear Time Series'...
       ,'exp Helax AB. 335 data files'...
       ,'uc  Unconstrained Nonlinear'...
       ,'qp  Quadratic Programming'...
       ,'con Constrained Nonlinear'...
       ,'ls  Nonlinear Least Squares'...
       ,'lls Linear Least Squares'...
       ,'cls Constrained Least Squares'...
       ,'mip Mixed Integer Programming'...
       ,'lp  Linear Programming'...
       ,'glb Box-Bounded Global Optimization'...
       ,'glc Constrained Global Optimization'...
       ,'miqp  Mixed-Integer Quadratic'...
       ,'minlp Mixed-Integer Nonlinear'...
       ,'sdp   Semidefinite Programming'...
       ,'bmi   Linear SDP with BMI'...
       ,'cgo   Costly Global Optimization'...
       ,'ode   Parameter estimation in ODE'...
       ,'exp   Exponential Fitting'...
       ,'miqq  MIQP w Quadratic Constr'...
       ,'gp    Geometric Programming'...
       );

%      ,'nts Nonlinear time series'...
%      ,'oc  Optimal control'...

tomProb.File=str2mat(...
        'mgh_prob'...
       ,'cto_prob'...
       ,'ctl_prob'...
       ,'uto_prob'...
       ,'utl_prob'...
       ,'amp_prob'...
       ,'nls_prob'...
       ,'nts_prob'...
       ,'helax_prob'...
       ,'uc_prob'...
       ,'qp_prob'...
       ,'con_prob'...
       ,'ls_prob'...
       ,'lls_prob'...
       ,'cls_prob'...
       ,'mip_prob'...
       ,'lp_prob'...
       ,'glb_prob'...
       ,'glc_prob'...
       ,'miqp_prob'...
       ,'minlp_prob'...
       ,'sdp_prob'...
       ,'bmi_prob'...
       ,'cgo_prob'...
       ,'od_prob'...
       ,'exp_prob'...
       ,'miqq_prob'...
       ,'gp_prob'...
       );

%      ,'oc_prob'...
%      ,'nts_prob'...

% mexType  Vector with allowed types of problems. 
%    0 = Matlab, 1=AMPL, 2=CUTE, 3=NTS, 4=Helax many big files
tomProb.mex     =[ 0 2 2 2 2 1 -1  3 4 0 0 0 0 0 0 0 0 0  0  0  0  0  0  0 ...
                   0  0  0  0 ];
tomProb.probType=[ 4 3 3 1 1 3  6 15 6 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 ...
                  16 17 18 19];

% The basic problems should not be possible to delete.
tomProb.Basic = length(tomProb.mex);

s=which('tomlablic');
[TomProbPath,NAME,EXT,VERSN] = fileparts(s);

fprintf('Found the path to CreateTomProb as %s\n',TomProbPath);

if isunix
   TomFile=[TomProbPath '/lib/' 'TomlabProblem.mat'];
else
   TomFile=[TomProbPath '\lib\' 'TomlabProblem.mat'];
end
fprintf('Create a new file with information about predefined TOMLAB');
fprintf(' test problems?\n');
fprintf('File Name is %s',TomFile);
fprintf('\n\n');
fprintf('Overwrite??? (ctrl-c to break)\n');

pause

delete(TomFile);
save(TomFile,'tomProb','-V6');

% MODIFICATION LOG:
%
% 990913  hkh  Written
% 990916  hkh  Change the order. Default last.
% 000820  hkh  Update for v3.0
% 000910  hkh  Moving the file from lib changes logic
% 011030  hkh  Check for Unix/Linux and set correct slash
% 020701  hkh  Add four more problem types
% 020702  hkh  Minor name changes
% 030117  hkh  Change miqq to bmi, use Linear SDP with BMI as type 14
% 050117  med  mlint review
% 050502  hkh  Add types CGO, ODE, OC. Use fileparts to get mat-file path
% 050503  hkh  Add type MIQQ
% 050602  hkh  Add type gp