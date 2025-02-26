
#const n = 2. % Define subgrid size (2x2 for a 4x4 board)

% 4x4 grid
row(1..4).
column(1..4).

value(1..4).

% 1 number per cell
1 { sudoku(X, Y, N) : value(N) } 1 :- row(X), column(Y).

% Assign each cell to a 2×2 subgrid
subgrid(X, Y, G) :- row(X), column(Y), G = 1 + (((X - 1) / n) * n + (Y - 1) / n).

% constraints

% initial
:- sudoku(X, Y, N), initial(X, Y, N'), N != N'.

% unique numbers in each row
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.

% unique numbers in each column
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.


#show sudoku/3.
#show subgrid/3.
