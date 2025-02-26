% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% implementation

% 4x4 grid
row(1..4).
column(1..4).

value(1..4).

% initial values
sudoku(X,Y,N) :- initial(X,Y,N).

% 1 number per cell
1 { sudoku(X,Y,N) : value(N) } 1 :- row(X), column(Y).

% Exclude duplicate values in rows
:- sudoku(X,Y1,N), sudoku(X,Y2,N), Y1 != Y2.

% Exclude duplicate values in columns
:- sudoku(X1,Y,N), sudoku(X2,Y,N), X1 != X2.

#show sudoku/3.