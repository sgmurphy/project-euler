-module('solution-1').
-export([start/0]).

% The prime factors of 13195 are 5, 7, 13 and 29.
% 
% What is the largest prime factor of the number 600851475143?

start() ->
	Input = get_input("Enter a number to find its largest prime factor", 600851475143),
	io:fwrite("Largest prime factor: ~w~n", [hd(prime_factors(Input))]).

get_input(Prompt, Default) ->
	Input = string:strip(
		string:strip(
			io:get_line(
				lists:concat([Prompt, " [", Default, "]: "])
			), 
			right, 
			$\n
		)
	),
	if
		Input =:= [] -> Default;
		Input =/= [] andalso is_integer(Default) -> element(1, string:to_integer(Input));
		Input =/= [] -> Input
	end.
	
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