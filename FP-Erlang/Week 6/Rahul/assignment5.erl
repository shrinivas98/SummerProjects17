-module(assignment5).
-export([add/1, add/2, subtract/1, subtract/2, multiply/1, multiply/2, divide/1,
 divide/2, greaterThanX/1, greaterThanX/2, lessThanX/1, lessThanX/2, isremdr/1, isremdr/2,
 derive/2, integral/4, foldl/3, map/2, filterl/2, lessthanList/2, sumList/1,
 squareList/1, evenList/1, factList/1, foldr/3, foldl2/3]).

add(X) -> fun(Y) -> X+Y end.

add(X,Y) -> G = add(X), G(Y).

subtract(X) -> fun(Y) -> X-Y end.

subtract(X,Y) -> G = subtract(X), G(Y).

multiply(X) -> fun(Y) -> X*Y end.

multiply(X,Y) -> G = multiply(X), G(Y).

divide(X) -> fun(Y) -> X/Y end.

divide(X,Y) -> G = divide(X), G(Y).

isremdr(X) -> fun(Y) -> Y rem X == 0 end.

isremdr(X,Y) -> G = isremdr(X), G(Y).

greaterThanX(X) -> fun(Y) -> Y>X end.

greaterThanX(X,Y) -> G = greaterThanX(X), G(Y).

lessThanX(X) -> fun(Y) -> X>Y end.

lessThanX(X,Y) -> G = lessThanX(X), G(Y).

fact(X) -> fact(X,1).
fact(0,Prod) -> Prod;
fact(X,Prod) -> F = multiply(X),
fact(X-1, F(Prod)).

derive(F,H) -> fun(X) -> (F(X+H) - F(X))/H end.

integral(A, B, N, F) -> simp(A, (B-A)/N, N, F, F(A)+F(B)).

simp(_, H, 0, _, Ans) -> (H/6)*Ans;
simp(_, H, 1, _, Ans) -> (H/3)*Ans;
simp(A, H, N, F, Ans) when (N-1) rem 2 /= 0 -> simp(A, H, N-1, F, Ans + (4*F(A + ((N-1)*H))));
simp(A, H, N, F, Ans) when (N-1) rem 2 == 0 -> simp(A, H, N-1, F, Ans + (2*F(A + ((N-1)*H)))).

foldl(_, Element, []) -> Element;
foldl(F, Element, [H|T]) -> foldl(F, F(H,Element), T).

map(F, List) -> map(F, List, []).
map(_,[],Acc) -> Acc;
map(F, [H|T], Acc) -> map(F, T, Acc++[F(H)]).

filterl(Pred, List) -> filterl(Pred, List, []).
filterl(_, [], Acc) -> Acc;
filterl(Pred, [H|T], Acc) ->
    case Pred(H) of
      true -> filterl(Pred, T, Acc++[H]);
      false -> filterl(Pred, T, Acc)
      end.

lessthanList(List, X) -> filterl(lessThanX(X), List).

sumList(List) ->
F = fun(X,Y) -> G = add(X), G(Y) end,
foldl(F,0,List).

squareList(List)->
F = fun(X) -> G = multiply(X), G(X) end,
map(F,List).

evenList(List) -> filterl(isremdr(2), List).

factList(List) -> map(fun(X) -> fact(X) end, List).

foldr(_, Element, []) -> Element;
foldr(F, Element, [H|T]) -> F(H, foldr(F, Element, T)).

foldl2(F, Element, List) -> foldr(F, Element, lists:reverse(List)).
