-module('solution-1').
-export([start/0]).

% http://projecteuler.net/problem=25

start() ->
	io:fwrite("First term in the Fibonacci sequence that contains 1000 digits: ~w~n", [fib(1000)]).

fib(Max) ->
	fib(Max, 1, 0, 1).

fib(Max, Current, Previous, Term) ->
	Length = length(integer_to_list(Current)),
	if
		Length >= Max -> Term;
		Length < Max -> fib(Max, Current + Previous, Current, Term + 1)
	end.