-module('solution-1').
-export([start/0]).

% http://projecteuler.net/problem=4

start() ->
	io:fwrite("Largest palindromic product of 2 3-digit numbers: ~w~n", [palindrome_products(lists:seq(100, 999))]).

palindrome_products(L) ->
	palindrome_products(L, L, []).

palindrome_products([], [], PP) ->
	lists:sort(PP);
palindrome_products([_|F1T], [], PP) ->
	palindrome_products(F1T, F1T, PP);
palindrome_products([F1|F1T], [F2|F2T], PP) ->
	P = F1 * F2,
	PL = integer_to_list(P),

	case PL == lists:reverse(PL) of
		true -> palindrome_products([F1|F1T], F2T, [P|PP]);
		false -> palindrome_products([F1|F1T], F2T, PP)
	end.