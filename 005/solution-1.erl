-module('solution-1').
-export([start/0]).

% http://projecteuler.net/problem=5

start() ->
	io:fwrite("Smallest positive number evenly divisible by the numbers 1 to 20: ~w~n", [lcm(lists:seq(1, 20))]).

lcm(D) ->
	lcm(D, lists:max(D)).

lcm(D, M) ->
	case lists:any(fun(Elem) -> M rem Elem =/= 0 end, D) of
		true -> lcm(D, M + 1);
		false -> M
	end.