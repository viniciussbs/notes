-module (misc).
-export ([sum/1]).

% main function
sum(L)  -> sum(L, 0).

% auxiliary functions
sum([], N)      -> N;
sum([H|T], N)   -> sum(T, H+N).