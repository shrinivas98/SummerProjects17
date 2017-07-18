%%%-------------------------------------------------------------------
%%% @author shashankp
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end

%%%-------------------------------------------------------------------
-module(higherorder).
-author("shashankp").

%% API
-export([add/1, add/2, subtract/1, subtract/2, multiply/1, multiply/2, divide/1, divide/2, greaterThanX/1, greaterThanX/2, lessThanX/1, lessThanX/2, fold/2, fold/3, filter/1, filter/2, map/1, map/2, all/1, all/2, takewhile/1, takewhile/2, derive/2, integral/4, foldr/3, foldl/3]).

% Question 1

add(X) ->
  fun(Y) -> X + Y end.

add(X, Y) ->
  F = add(X),
  F(Y).

subtract(X) ->
  fun(Y) -> X - Y end.

subtract(X, Y) ->
  F = subtract(X),
  F(Y).

multiply(X) ->
  fun(Y) -> X * Y end.

multiply(X, Y) ->
  F = multiply(X),
  F(Y).

divide(X) ->
  fun(Y) -> X / Y end.

divide(X, Y) ->
  F = divide(X),
  F(Y).

greaterThanX(X) ->
  fun(Y) -> Y > X end.

greaterThanX(X, Y) ->
  F = greaterThanX(Y),
  F(X).

lessThanX(X) ->
  fun(Y) -> Y < X end.

lessThanX(X, Y) ->
  F = lessThanX(Y),
  F(X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Examples with definition

fold(F, Answer) ->
  fun([H | T]) ->
    FoldF = fold(F, F(H, Answer)),
    FoldF(T);
  ([]) -> Answer end.

fold(F, Answer, List) ->
  Func = fold(F, Answer),
  Func(List).

filter(Pred) -> filter(Pred, [], 0).                  %% Added 0 as third argument to avoid conflict with filter(Pred, List)
filter(Pred, Answer, _) ->
  fun([H | T]) ->
    case Pred(H) of
      true  ->
        FilterT = filter(Pred, [H|Answer], 0),
        FilterT(T);
      false ->
        FilterF = filter(Pred, Answer, 0),
        FilterF(T)
    end;
    ([]) -> lists:reverse(Answer) end.

filter(Pred, List) ->
  F = filter(Pred),
  F(List).

map(F) ->
  fun([H|T]) ->
    MapF = map(F),
    [F(H)| MapF(T)];
    ([]) -> [] end.

map(F, List) ->
  Func = map(F),
  Func(List).

% checks if all elements in list satisfy Pred. Returns true if Pred(Elem) returns true for all elements Elem in list, otherwise false
all(Pred) ->
  fun([H | T]) ->
    case Pred(H) of
      true ->
        AllPred = all(Pred),
        AllPred(T);
      false -> false
    end;
    ([]) -> true end.

all(Pred, List) ->
  F = all(Pred),
  F(List).

% Takes elements Elem from list while Pred(Elem) returns true, that is, the function returns the longest prefix of the list for which all elements satisfy the predicate.

takewhile(Pred) -> takewhile(Pred, [], 0).                     %% Added 0 as third argument to avoid conflict with takewhile(Pred, List)
takewhile(Pred, Answer, _) ->
  fun([H | T]) ->
    case Pred(H) of
      true  ->
        TakewhilePred = takewhile(Pred, [H|Answer], 0),
        TakewhilePred(T);
      false -> lists:reverse(Answer)
    end;
    ([]) -> lists:reverse(Answer) end.

takewhile(Pred, List) ->
  F = takewhile(Pred),
  F(List).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2

derive(F, H) ->
  fun(X) -> (F(X + H) - F(X)) / H end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 3

integral(A, B, N, F) ->
  H = (B - A) / N,
  H * func(F, A, 0, H, N) / 3.
func(F, A, K, H, N) when K =:= N ->
  F(A + K * H);
func(F, A, 0, H, N) ->
  F(A) + func(F, A, 1, H, N);
func(F, A, K, H, N) when (K rem 2 =:= 1) ->
  4 * F(A + K * H) + func(F, A, K + 1, H, N);
func(F, A, K, H, N) when (K rem 2 =:= 0) ->
  2 * F(A + K * H) + func(F, A, K + 1, H, N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 4

foldr(_, Answer, []) -> Answer;
foldr(F, Answer, List) ->
  [H|T] = lists:reverse(List),
  foldr(F, F(H, Answer), lists:reverse(T)).

foldl(_, Answer, []) -> Answer;
foldl(F, Answer, List) ->
  foldr(F, Answer, foldr(fun(X,Acc) -> Acc ++ [X] end, [], List)).
