-module(assignment4).
%%-module(ques1).
-export([for/4]).
-export([index_in_list_by_predicate/3]).
-export([for_all/2,there_exists/2,there_exists_2/2]).
-export([foldl/3,foldr/3,filterr/2,filterl/2]).
-export([scanl/3,scanr/3]).
-export([rem_dupsl/1,rem_dupsr/1]).
-export([qsort/1]).
-export([square/1]).
-export([takewhile/2,exceeding/0]).
-export([minsubset/2]).

for(I,Pred,Update,Body)->
    case Pred(I) of 
    true->Body(I),
          for(Update(I),Pred,Update,Body);
    false-> ok
   end.
%%-module(ques2).

index_in_list_by_predicate(L,E,P)->index_in_list_by_predicate(L,E,P,0).
index_in_list_by_predicate([],_,_,_)-> 'not_found';
index_in_list_by_predicate([H|T],E,P,Position)->
     case P(H,E) of
         true->Position;
         false->index_in_list_by_predicate(T,E,P,Position+1)

end.

%%-module(ques3).

for_all([],_)->true;
for_all([H|T],P)->
    case P(H) of
     	true->for_all(T,P);
     	false-> false
     end. 


there_exists([],_)->false;
there_exists([H|T],P)->
    case P(H) of
    	true->true;
    	false->there_exists(T,P)
    end.


there_exists_2(L,P)->there_exists_2(L,P,1).
there_exists_2([],_,2)->true;
there_exists_2([],_,_)->false;
there_exists_2([H|T],P,N)->
        case P(H) of
    	true ->there_exists_2(T,P,N+1);
    	false->there_exists_2(T,P,N)
 end.   	

%%-module(ques4).

foldl(F, Accu, [Hd|Tail]) -> 
foldl(F, F(Hd, Accu), Tail); 
foldl(F, Accu, []) -> Accu.

foldr(_,X,[]) -> X;
foldr(F,X,List) -> Last=lists:last(List),
foldr(F,F(Last,X),lists:droplast(List)).

filterr(Pred,L)->
	List= fun(X,Y)->
			case Pred(X) of
				true->[X|Y];
				false->Y
			end
		end,
	foldr(List,[],L).

filterl(Pred,L)->
	List= fun(X,Y)->
			case Pred(X) of
				true->[X|Y];
				false->Y
			end
		end,
	foldl(List,[],L).

%%-module(ques5).

scanl(F,Acc,L)->scanl(F,Acc,L,Acc).
scanl(_,_,[],List)-> lists:reverse(List);
scanl(F,Acc,[H|T],List)->scanl(F,F(H,Acc),T,[F(H,Acc)|List]).

scanr(F,Acc,L)->scanr(F,Acc,L,Acc).
scanr(_,_,[],List)-> List;
scanr(F,Acc,[H|T],List)->scanr(F,F(H,Acc),T,[F(H,Acc)|List]).

%%-module(ques6).

rem_dupsl([]) -> [];
rem_dupsl([H|T]) ->
  F = fun(X, Accu) ->
    Last = lists:last(Accu),
    if X =:= Last -> Accu;
      true -> Accu ++ [X]
    end
      end,
  foldl(F, [H], T).

rem_dupsr([X]) -> [X];
rem_dupsr([H | T]) ->
  F = fun(X, Accu) ->
    case hd(Accu) =:= X of
      true -> Accu;
      false -> [X] ++ Accu
    end
      end,
  foldr(F, [H], T).

%%-module(ques7).
qsort([])->[];
qsort([H|T]) -> qsort(filterl(fun(X) -> X<H end, T)) ++ [H] ++ qsort(filterl(fun(X)-> X>=H end, T)).

%%-module(ques8).
square(L) -> lists:foldl(fun(A,Newlist) ->
 case A/=2 of true -> Newlist++[A*A];
false -> Newlist end end,[],L).


%%-module(ques9).

takewhile(Pred, [H | T]) ->
  case Pred(H) of
    true -> [H] ++ takewhile(Pred, T);
    false -> []
  end;
takewhile(_, []) -> [].

exceeding() ->
  F1 = fun(X) -> X < 1000
       end,
  F2 = fun(X, Ans) ->
    Ans + math:sqrt(X)
       end,
  1 + length(takewhile(F1, scanl(F2, 1, lists:seq(2, 500)))).


%%-module(ques10).

minsubset(List, S) ->
  case (lists:sum(List) < S) of
    true -> not_found;
    false -> F = fun(X, NList) ->
      case lists:sum(NList) >= S of
        true -> NList;
        false -> NList ++ [X]
      end
                 end,
      length(foldl(F, [], lists:reverse(lists:sort(List))))
  end.





