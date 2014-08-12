%% Copyright (C) 2014 Colin B. Macdonald
%%
%% This file is part of OctSymPy.
%%
%% OctSymPy is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published
%% by the Free Software Foundation; either version 3 of the License,
%% or (at your option) any later version.
%%
%% This software is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty
%% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
%% the GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public
%% License along with this software; see the file COPYING.
%% If not, see <http://www.gnu.org/licenses/>.

%% -*- texinfo -*-
%% @deftypefn  {Function File} {@var{a} =} atan2 (@var{x}, @var{y})
%% Symbolic atan2 function, return angle from a point.
%%
%% @end deftypefn

%% Author: Colin B. Macdonald
%% Keywords: symbolic

function a = atan2(y, x)

  a = binop_helper (y, x, 'sp.atan2');

end


%!test
%! % some angles
%! e = sym(1);
%! a = atan2(0, e);
%! assert (isequal (a, sym(0)))
%! a = atan2(e, 0);
%! assert (isequal (a, sym(pi)/2))

%!test
%! % symbols can give numerical answer
%! syms x positive
%! a = atan2(0, x);
%! assert (isequal (a, sym(0)))
%! a = atan2(x, 0);
%! assert (isequal (a, sym(pi)/2))
%! a = atan2(-x, 0);
%! assert (isequal (a, -sym(pi)/2))

%!test
%! % matrices
%! x = sym([1 -2; 0 0]);
%! y = sym([0 0; 8 -3]);
%! a = atan2(y, x);
%! sp = sym(pi);
%! aex = [0 sp; sp/2 -sp/2];
%! assert (isequal (a, aex))
