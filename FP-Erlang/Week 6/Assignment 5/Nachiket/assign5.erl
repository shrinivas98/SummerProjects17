%
%
%  Assignment 5
%
%  Author- Nachiket
%
%
%
-module(assign5).
-compile(export_all).
-import(math,[pow/2]).

%
%  Q1) Currying In Erlang
%     i) add()
%     ii) subtract()
%     iii) multiply()
%     iV)  divide()

add(X) -> 
    AddX = fun(Y) -> X + Y end,
    AddX.

add(X,Y)->
	A= add(X),
	A(Y).

subtract(X)->
	SubX = fun(Y) -> X-Y end,
	SubX.

subtract(X,Y)->
	S = subtract(X),
	S(Y).

multiply(X)->
	MulX = fun(Y) -> X*Y end,
	MulX.

multiply(X,Y)->
	M = multiply(X),
	M(Y).

divide(X)->
	DivX = fun(Y) -> X/Y end,
	DivX.

divide(X,Y)->
	D = divide(X),
	D(Y).
%     i) greaterThanX()
%     ii) lessThanX()
%

greaterThanX(A) ->
	GtX = fun(B) -> B>A end,
	GtX.

lessThanX(A) ->
	LsX = fun(B) -> B<A end,
	LsX.

map(_,[])->[];
map(F,[H|T]) -> [F(H)|map(F,T)].

filter(Pred, L) -> lists:reverse(filter(Pred, L,[])).
filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
	case Pred(H) of
		true  -> filter(Pred, T, [H|Acc]);
		false -> filter(Pred, T, Acc)
	end.
%     
%  Use of currying functions in higher order function examples
%   i)increaseListByX(L,X)
%  ii)multiplyListByX(L,X)
% iii)lessByXList(L,X)
%  iV)greaterByXList(L,X)
%   V)divideListByX(L,X)
%
increaseListByX(L,X)->
	map(add(X),L).

multiplyListByX(L,X)->
	map(multiply(X),L).

lessByXList(L,X)->
	filter(lessThanX(X),L).

greaterByXList(L,X)->
	filter(greaterThanX(X),L).

divideListByX(L,X)->
	map(divide(X),L).
%
% derive function
%
derive(F,H) ->
	Fun= fun(X) -> (F(X+H)-F(X))/H end,
	Fun.
%
% Integral function
%
integral(A,B,N,F) -> integral(A,B,N,F,1,0.0).
integral(A,B,N,F,N,S)->
	(B-A)*(S+F(A)+F(B))/N/3;
integral(A,B,N,F,K,S)->
	integral(A,B,N,F,K+1,S+(pow(2,K rem 2)*2*F(A+(K*(B-A)/N)))).
%
% foldl implementation using foldr
%
foldl(_,Acc,[])-> Acc;
foldl(F,Acc,[H|T])->
	foldl(F,lists:foldr(F,Acc,[H]),T).

%
% foldr implementation using foldl
%
%   It can be implemented using lists:reverse function
%
%  1)  foldr(F, Acc, L) -> foldl(F, Acc, lists:reverse(L, [])).
%
%    Limitation of above implementation is this may not work for very large lists
%    Since it will consume heap memory(due to dynamic alloc by reverse) and may run out of space and crash
%
%   

%
% Nature of foldr
%
%   The Erlang official foldr implementation is as follows:
%          foldr(F, Accu, [Hd|Tail]) ->
%    		F(Hd, foldr(F, Accu, Tail));
%          foldr(F, Accu, []) when is_function(F, 2) -> Accu.
%
%    The above implementation is NOT tail-recursive as it consumes huge chunks of memory for really 
%    large lists. Hence memory consumption is more in stack.
%    It will also tend to consume time as the first element has to wait for all the next elements to be acted 
%    upon by the anonymous function F.