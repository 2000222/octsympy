%% Copyright (C) 2016 Colin B. Macdonald and Lagu
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
%% @deftypefn {Function File}  {@var{r} =} union (@var{A}, @var{B})
%% @deftypefnx {Function File}  {@var{r} =} union (@var{A}, @var{B}, @dots{}, 'intervals')
%% Return the union of elements of two sets.
%%
%% @seealso{intersect, setdiff, setxor,function r = intersect(varargin)

function r = union(a, b)

  cmd = {
         'a, b = _ins'
         'if isinstance(a, sp.Set) or isinstance(b, sp.Set):'
         '    return a | b,'
         ''
         'A = sp.FiniteSet(*(list(a) if isinstance(a, sp.MatrixBase) else [a]))'
         'B = sp.FiniteSet(*(list(b) if isinstance(b, sp.MatrixBase) else [b]))'
         'C = A | B'
         'return sp.Matrix([list(C)]),'
        };

    r = python_cmd (cmd, sym(a), sym(b));

end

%!test
%! A = sym([1 2 3]);
%! B = sym([1 2 4]);
%! C = union(A, B);
%! D = sym([1 2 3 4]);
%! assert (isequal (C, D))

%!test
%! % one nonsym
%! A = sym([1 2 3]);
%! B = [1 2 4];
%! C = union(A, B);
%! D = sym([1 2 3 4]);
%! assert (isequal (C, D))

%!test
%! % empty
%! A = sym([1 2 3]);
%! C = union(A, A);
%! assert (isequal(C, A))

%!test
%! % empty input
%! A = sym([1 2]);
%! C = union(A, []);
%! assert (isequal (C, sym([1 2])))


%!test
%! % scalar
%! syms x
%! assert (isequal (union([x 1], x), [1 x]))
%! assert (isequal (union(x, x), x))

%!test
%! A = interval(sym(1), 3);
%! B = interval(sym(2), 5);
%! C = union(A, B);
%! assert( isequal( C, interval(sym(1), 5)))
