-module (assignment5).
-export ([add/2,add/1,subtract/2,subtract/1,multiply/2,multiply/1,divide/2,divide/1,greaterThanX/1,lessThanX/1,three_a/2,three_b/1,three_c/1,derive/2,integral/4,foldl/3]).

%%%%%%%%%%%%%%%%%%%%%%%%  QUESTION 1  %%%%%%%%%%%%%%%%%%%%%%%%

% Part 1 %
add(X) -> fun(Y) -> X + Y end.
add(X,Y) -> 
		F=add(X),
		F(Y).

subtract(X) -> fun(Y) -> X-Y end.
subtract(X,Y) -> 
		F=subtract(X),
		F(Y).

multiply(X) -> fun(Y) -> X*Y end.
multiply(X,Y) -> 
		F=multiply(X),
		F(Y).

divide(X) -> fun(Y) -> X/Y end.
divide(X,Y) -> 
		F=divide(X),
		F(Y).
		
% Part 2 %
greaterThanX(X) -> fun(Y) -> case Y>X of true -> true; false -> false end end.
lessThanX(X) -> fun(Y) -> case Y<X of true -> true; false -> false end end.

% Part 3 %
three_a(Function,Factor) -> fun(List) -> lists:foldl(Function,Factor,List) end.
three_b(Function) -> fun(List) -> lists:filter(Function,List) end.
three_c(Function) -> fun(List) -> lists:map(Function,List) end.

%%%%%%%%%%%%%%%%%%%%%%%%  QUESTION 2  %%%%%%%%%%%%%%%%%%%%%%%%

derive(F,H) -> fun(X) -> (F(X+H) - F(X))/H end.

%%%%%%%%%%%%%%%%%%%%%%%%  QUESTION 3  %%%%%%%%%%%%%%%%%%%%%%%%

integral(A,B,N,F) -> integral(A,B,N,F,0,0).

integral(A,B,N,_,X,Ans) when X>N -> (((B-A)/N)*Ans)/3;
integral(A,B,N,F,X,Ans) when X==0 -> integral(A,B,N,F,X+1,Ans + F(A));
integral(A,B,N,F,X,Ans) when X==N -> integral(A,B,N,F,X+1,Ans + F(A + X*(B-A)/N));
integral(A,B,N,F,X,Ans) when ((X rem 2)==1) -> integral(A,B,N,F,X+1,Ans + (4*F(A + X*(B-A)/N)));
integral(A,B,N,F,X,Ans) when ((X rem 2)==0) -> integral(A,B,N,F,X+1,Ans + (2*F(A + X*(B-A)/N))).

%%%%%%%%%%%%%%%%%%%%%%%%  QUESTION 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

foldl(Function,Factor,List) -> lists:foldr(fun(X,Acc) -> Acc ++ [X] end,[],lists:foldr(Function,Factor,List)).