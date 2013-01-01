-module('solution-1').
-export([start/0]).

% The prime factors of 13195 are 5, 7, 13 and 29.
% 
% What is the largest prime factor of the number 600851475143?

start() ->
	io:fwrite("Largest prime factor of 600851475143: ~w~n", [hd(prime_factors(600851475143))]).
	
prime_factors(N) ->
	prime_factors(N, 2, []).
	
prime_factors(N, D, F) ->
	% start with smallest prime (2) and work up
	% if N is not divisible by D, then no factors of N will be divisible by D either
	if
		N < D -> F;
		N rem D =:= 0 -> prime_factors(N div D, D, [D|F]);
		N rem D =/= 0 -> prime_factors(N, D + 1, F)
	end.