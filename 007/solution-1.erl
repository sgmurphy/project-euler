-module('solution-1').
-export([start/0]).

% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
% 
% What is the 10 001st prime number?

start() ->
	io:fwrite("10001st prime: ~w~n", [hd(primes(10001))]).
	
primes(Count) ->
	primes(Count, [2], 3).
	
primes(Count, Primes, _) when length(Primes) =:= Count ->
	Primes;

primes(Count, Primes, Candidate) ->
	case lists:any(fun(Prime) -> Candidate rem Prime =:= 0 end, Primes) of
		true -> primes(Count, Primes, Candidate + 2);
		false -> primes(Count, [Candidate|Primes], Candidate + 2)
	end.