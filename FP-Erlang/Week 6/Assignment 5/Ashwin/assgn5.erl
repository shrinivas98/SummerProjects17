%########################################### ASSIGNMENT 5 ###########################################
%########################################### Ashwin Joisa ###########################################
-module(assgn5).

% ############################################################################# Question 1
-export([add/1, subtract/1, multiply/1, divide/1]).
-export([add2/2, subtract2/2, multiply2/2, divide2/2]).
-export([greaterThanX/1, lessThanX/1]).
% Function 1
-export([takewhilePred/1, twp/2]).
% Function 2
-export([dropwhilePred/1, dw/2]).
% Function 3
-export([map/2, mapF/1]).
% Function 4
-export([any/2, anyPred/1]).
% Function 5
-export([all/2, allPred/1]).
% ############################################################################# Question 2
-export([derive/2]).
% ############################################################################# Question 3
-export([integral/4, integral/5]).
% ############################################################################# Question 4
-export([foldl/3]).


% ########################################################################################## Question 1

% Part 1

add(A) -> fun(X) -> X+A end.
subtract(A) -> fun(X) -> A-X end.
multiply(A) -> fun(X) -> X*A end.
divide(A) -> fun(X) -> A/X end.

add2(X, Y) -> 
	F = add(X),
	F(Y).

subtract2(X, Y) -> 
	F = subtract(X),
	F(Y).

multiply2(X, Y) -> 
	F = multiply(X),
	F(Y).

divide2(X, Y) -> 
	F = divide(X),
	F(Y).

% Part 2

greaterThanX(A) -> fun(X) -> X>A end.
lessThanX(A) -> fun(X) -> X<A end.


% Part 3

% FUNCTION 1
% takewhilePred(L) takes elements X from a list L as long as the predicate Pred(X) is true.
takewhilePred(Pred) -> fun(L) -> assgn5:twp(Pred, L) end.

twp(_, []) -> [];
twp(Pred, [H|T]) ->
	case Pred(H) of
		true  -> [H|twp(Pred, T)];
		false -> []
	end.


% FUNCTION 2
% dropwhile is the complement of takewhile.
dropwhilePred(Pred) -> fun(L) -> assgn5:dw(Pred, L) end.

dw(_, []) -> [];
dw(Pred, [H|T]) ->
	case Pred(H) of
		true  -> dw(Pred, T);
		false -> [H|T]
	end.


% FUNCTION 3
% mapF takes a function of one argument.
% It returns the list obtained by applying the function to every argument in the list.
mapF(F) -> fun(L) -> assgn5:map(F, L) end.

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F, T)].


% FUNCTION 4
% any takes a predicate Pred of one argument. 
% Any is true if there is a term X in the list such that Pred(X) is true.
anyPred(Pred) -> fun(L) -> assgn5:any(Pred, L) end.

any(_, []) -> false;
any(Pred, [H|T]) ->
	case Pred(H) of
		true  ->  true;
		false ->  any(Pred, T)
	end.


% FUNCTION 5
% all has the same arguments as any. It is true if the predicate applied to all elements in the list is true.
allPred(Pred) -> fun(L) -> assgn5:all(Pred, L) end.

all(_, []) -> true;
all(Pred, [H|T]) ->
	case Pred(H) of
		true  ->  all(Pred, T);
		false ->  false
	end.

% ########################################################################################## Question 2

derive(F, H) -> fun(X) -> (F(X+H) - F(X))/H end.

% ########################################################################################## Question 3

integral(A, B, N, F) -> 
	H = (B-A)/N,
	(integral(A+H, H, N, F, N) + F(A)) * H/3.

integral(X, _, 1, F, _) -> F(X);
integral(X, S, N, F, N) -> integral(X+S, S, N-1, F, N) + 4*F(X);
integral(X, S, 2, F, N) -> integral(X+S, S, 1, F, N) + 4*F(X);
integral(X, S, K, F, N) -> 
	case K rem 2=:=0 of
		true -> integral(X+S, S, K-1, F, N) + 4*F(X);
		false-> integral(X+S, S, K-1, F, N) + 2*F(X)
	end.

% ########################################################################################## Question 4

foldl(F, Acc, L) -> lists:foldr(F, Acc, lists:reverse(L)).