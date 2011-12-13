% TOMLAB MSNLP MINLP Solver
%
% function Result = tomRun('msnlp',Prob);
%
% MSNLP solves constrained nonlinear mixed-integer problems of
% the type:
%
%    min f(x)
%
%    subject to
%
%    x_L <=  x   <= x_U, variable bounds
%    b_L <= A*x  <= b_U, linear constraints
%    c_L <= c(x) <= c_L, nonlinear constraints
%
%  where x_L, x_U, x are n*1-vectors, b_L,b_U are m1*1-vectors, A is a dense
%  or sparse m1*n matrix, and c_L, c_U, c(x) are m2*1-vectors.
%
%  Furthermore, x_i are restricted to integer values for i in I,
%  where I is a subset of {1,2,...,n}, x in R^n
%
% ------------------------------------------------------------------
%
% INPUT:
%
% Prob          Problem structure in TOMLAB format. Fields used are:
%
%    A          Linear constraints coefficient matrix.
%    x_L, x_U   Bounds on variables.
%    b_L, b_U   Bounds on linear constraints.
%    c_L, c_U   Bounds on nonlinear constraints.
%               For equality constraints (or fixed variables), set
%               e.g. b_L(k) == b_U(k).
%
%    PriLevOpt  Print level in MEX interface.
%
%    LargeScale Flag telling whether to treat the problem as sparse (1) or
%               dense. If set to 1, the user should also provide a sparse
%               0-1 matrix in Prob.ConsPattern giving the nonzero pattern.
%
%    MaxCPU     Maximum allowed time in seconds for the MSNLP run.
%               It is also possible to set this through the Prob.OQNLP.options.MAXTIME
%               parameter, in which case Prob.MaxCPU is ignored. MSNLP's
%               default value for MAXTIME is 1000 seconds.
%
%               Note that you may not necessarily get the "Time limit
%               exceeded" message from the solver although it stops because
%               of this.
%
% Prob.optParam Structure with optimization parameters. The following fields are used:
%
%    MaxIter    Maximum number of trial points to be generated by the MSNLP
%               multistart algorithm. Default: 1000
%
%               Increasing this limit can allow MSNLP to find a better solution.
%               The default is 1000 iterations. Try to raise it if your run using 1000
%               iterations doesn�t take too long.
%
% Prob.MIP      Structure with fields defining the integer properties of
%               the problem. The following fields are used:
%
%
%   IntVars:  
%               If empty, all variables are assumed non-integer 
%               If islogical(IntVars) (=all elements are 0/1), then
%               1 = integer variable, 0 = continuous variable.
%               If any element >1, IntVars is the indices for integer variables
%
% Prob.OQNLP    Structure with special fields for the MSNLP solver:
%
%    options    Structure array with options.
%               See the TOMLAB /MSNLP User's Guide for instructions and examples.
%
%    PrintFile  Name of file to receive the MSNLP iteration and results
%               log. Independent of PriLevOpt.
%
% OUTPUT:
% Result   Structure with optimization results
%
%   f_k      Function value at optimum.
%   g_k      Gradient of the function.
%
%   x_k      Solution vector.
%   x_0      Initial solution vector.
%
%   c_k      Nonlinear constraint residuals.
%   cJac     Nonlinear constraint gradients.
%
%
%   xState   State of variables. Free == 0; On lower == 1; On upper == 2;
%            Fixed == 3;
%   bState   State of linear constraints. Free == 0; Lower == 1; Upper == 2;
%            Equality == 3;
%   cState   State of nonlinear constraints. Free == 0; Lower == 1; Upper == 2;
%            Equality == 3;
%
%   v_k        Lagrangian multipliers (for bounds + dual solution vector).
%
%   ExitFlag   Exit status.
%
%   Inform     MSNLP information parameter.
%
%   rc               Reduced costs. If ninf=0, last m == -v_k.
%   Iter             Number of iterations.
%   FuncEv           Number of function evaluations.
%   GradEv           Number of gradient evaluations.
%   ConstrEv         Number of constraint evaluations.
%   QP.B             Basis vector in TOMLAB QP standard.
%   Solver           Name of the solver ('msnlp').
%   SolverAlgorithm  Description of the solver.
%

% Anders Goran, Tomlab Optimization Inc, E-mail: tomlab@tomopt.com
% Copyright (c) 2003-2007 by Tomlab Optimization Inc., $Release: 5.8.0 $
% Written Apr 8, 2003.   Last modified Apr 20, 2005.

function Result = msnlpTL(Prob)

if nargin < 1, error('msnlpTL needs the Prob structure as input');return;end

Result = oqmsTL(Prob, 2);
