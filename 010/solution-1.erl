-module('solution-1').
-export([start/0]).

% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
% 
% Find the sum of all the primes below two million.

start() ->
	io:fwrite("Sum of primes below two million: ~w~n", [lists:sum(sieve_of_eratosthenes(2000000))]).

sieve_of_eratosthenes(Max) when Max >= 2 ->
	% Create a list of all natural numbers up to Max.
	sieve_of_eratosthenes([], lists:seq(2, Max), math:pow(Max, 0.5)).

sieve_of_eratosthenes(Primes, [Sieve|Numbers], SMax) when Sieve >= SMax ->
	lists:reverse(Primes) ++ [Sieve] ++ Numbers;

sieve_of_eratosthenes(Primes, [Sieve|Numbers], SMax) ->
	sieve_of_eratosthenes([Sieve|Primes], [N || N <- Numbers, N rem Sieve =/= 0], SMax).