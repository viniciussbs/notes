-module(shop).
-export([cost/1]).
-export([total/1]).

cost(oranges)     -> 2;
cost(newspaper)   -> 3;
cost(apples)      -> 4;
cost(pears)       -> 5;
cost(milk)        -> 6.

total([])         -> 0;
total([{Product, Quantity}|T]) ->
  cost(Product) * Quantity + total(T).