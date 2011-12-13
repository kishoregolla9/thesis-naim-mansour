% function Result = publicitycampaignEx(PriLev)
%
% Creates a TOMLAB MIP problem for publicity campaign
%
% PUBLICITY CAMPAIGN
%
% The small company, Pronuevo, launches a new product into a regional
% market and wishes to have a publicity campaign using different
% media. It therefore contacts a regional publicity agency, PRCo,
% that specializes in this type of regional campaign and completely
% hands over this task for a total budget of $ 250,000. The agency
% knows the market well, that is, the impact of publicity in a local
% magazine or over the radio, or as a TV spot on the regional
% channel. It suggests addressing the market for two months through
% six different media. For each medium, it knows the cost and the
% number of people on which this medium has an impact. An index of
% the quality of perception of the campaign is also known for every
% medium.
%
% The publicity agency establishes a maximum number of uses of every
% medium (for instance, not more than eight transmissions of a TV
% spot). The table below lists all this information. Pronuevo wants
% the impact of the publicity campaign to reach at least 100,000
% people. Which media should be chosen and in which proportions to
% obtain a maximum index of perception quality?
%
% Data for the publicity campaign
% +------+---------------------+-------------------+------+-------------+----------+
% |      |                     |   People          | Unit |Maximum      |Perception|
% |Number|Media type           |potentially reached| cost |  use        | quality  |
% +------+---------------------+-------------------+------+-------------+----------+
% |   1  |Free weekly newspaper| 12,000            | 1,500| 4 weeks     |    3     |
% |   2  |Monthly magazine     |  1,500            | 8,000| 2 months    |    7     |
% |   3  |Weekly magazine      |  2,000            |12,000| 8 weeks     |    8     |
% |   4  |Radio spot           |  6,000            | 9,000|60 broadcasts|    2     |
% |   5  |Billboard 4x3 m      |  3,000            |24,000| 4 boards    |    6     |
% |   6  |TV spot              |  9,000            |51,000| 8 broadcasts|    9     |
% +------+---------------------+-------------------+------+-------------+----------+
%
% VARIABLES
%
% budget                     Budget
% people                     Persons potentially reached per media
% costs                      Unit costs
% maxuse                     Maximum use
% quality                    Perception quality
% minpeople                  
%
% RESULTS
%
% For an interpretation of the results, set PriLev > 1, for example:
% Result = publicitycampaignEx(2);
%
% REFERENCES
%
% Applications of optimization... Gueret, Prins, Seveaux
% http://web.univ-ubs.fr/lester/~sevaux/pl/index.html
%
% INPUT PARAMETERS
% PriLev       Print Level
%
% OUTPUT PARAMETERS
% Result       Result structure.

% Marcus Edvall, Tomlab Optimization Inc, E-mail: tomlab@tomopt.com
% Copyright (c) 2005-2005 by Tomlab Optimization Inc., $Release: 5.0.0$
% Written Dec 1, 2005.   Last modified Dec 1, 2005.

function Result = publicitycampaignEx(PriLev)

if nargin < 1
   PriLev = 1;
end

budget      = 250000;
people      = [12000 1500  2000 6000  3000  9000]';
costs       = [1500  8000 12000 9000 24000 51000]';
maxuse      = [4 2 8 60 4 8]';
quality     = [3 7 8 2 6 9]';
minpeople   = 100000;

Prob = publicitycampaign(budget, people, costs, maxuse, quality, minpeople);
Result = tomRun('cplex', Prob, PriLev);

if PriLev >1,
   invest  = Result.x_k;
   for   i = 1:length(invest),
      if invest(i) ~= 0,
         disp(['invest in ' num2str(invest(i)) ' uses of media number ' num2str(i)])
      end
   end
end

% MODIFICATION LOG
%
% 051201 med   Created.
% 060116 per   Added documentation.
% 060125 per   Moved disp to end
